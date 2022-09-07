import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../provider/big_question_storage.dart';

import '../../provider/projector/timer_provider.dart';
import '../../schema/question/big_question_item.dart';
import '../../schema/question/small_question_item.dart';
import '../../schema/user/user_model.dart';

class OnQuestionPage extends HookConsumerWidget {
  const OnQuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //! 対象となるユーザデータを取得する
    return FutureBuilder(
      future: SupabaseApi.getUserData(
        ref.read(deviceStateStreamProvider).value?.userId,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case ConnectionState.done:
            if (snapshot.data == null) {
              return const Center(child: Text('ユーザデータが存在しません'));
            }
            return QuestionDataFetchWidget(snapshot.data! as UserModel);
          case ConnectionState.active:
            return const Text('active');
          case ConnectionState.none:
            return const Text('none');
        }
      },
    );
  }
}

/// 問題データ取得部分
class QuestionDataFetchWidget extends HookConsumerWidget {
  const QuestionDataFetchWidget(this.user, {super.key});
  final UserModel user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bigQuestion = ref
        .watch(questionProvider)
        .firstWhere((e) => e.id == user.bigQuestionGroupId);
    return QuestionViewerWidget(
      bigQuestion.questions[ref.read(selectedDeviceIdProvider)!.positionId - 1],
    );
  }
}

// 問題表示部分
class QuestionViewerWidget extends HookConsumerWidget {
  const QuestionViewerWidget(this.question, {super.key});
  final BigQuestionItem question;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(onQuestionTimerProvdier).when<Widget>(
          data: (data) {
            switch (data) {
              case OnQuestionTimerState.question1:
                return SmallQuestionWidget(question.questions[0]);
              case OnQuestionTimerState.question2:
                return SmallQuestionWidget(question.questions[1]);
              case OnQuestionTimerState.question3:
                return SmallQuestionWidget(question.questions[2]);
              default:
                return Center(
                  child: Text(
                    data.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
            }
          },
          error: (error, stackTrace) => Text('error: $error'),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }
}

class SmallQuestionWidget extends StatefulHookConsumerWidget {
  const SmallQuestionWidget(this.item, {super.key});
  final SmallQuestionItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SmallQuestionWidgetState();
}

class _SmallQuestionWidgetState extends ConsumerState<SmallQuestionWidget> {
  double questionTextOpacity = 0;
  late SmallQuestionItem item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item = widget.item;
    questionTextOpacity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(),

        // 問題
        const Text(
          '第2問',
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: FittedBox(
            child: Row(
              children: [
                AnimatedOpacity(
                  opacity: questionTextOpacity,
                  duration: const Duration(milliseconds: 1000),
                  child: Math.tex(
                    item.questionStatement,
                    textStyle: const TextStyle(
                      fontSize: 800,
                    ),
                    onErrorFallback: (err) => Container(
                      color: const Color.fromARGB(255, 144, 10, 0),
                      child: Text(
                        'エラーが発生しました${err.messageWithType}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 230, 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 選択肢
        Column(
          children: [
            // 1,2
            Row(
              children: [
                const SizedBox(width: 20),
                Flexible(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        minRadius: 30,
                        backgroundColor: Color.fromARGB(255, 255, 157, 157),
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[0],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        minRadius: 30,
                        backgroundColor: Color.fromARGB(255, 178, 149, 255),
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[1],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            // 3,4
            Row(
              children: [
                const SizedBox(width: 20),
                Flexible(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        minRadius: 30,
                        backgroundColor: Color.fromARGB(255, 255, 197, 130),
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[2],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        minRadius: 30,
                        backgroundColor: Color.fromARGB(255, 119, 255, 141),
                        child: Text(
                          '4',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[3],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        )
      ],
    );
  }
}
