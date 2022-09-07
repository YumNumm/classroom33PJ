import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'provider/big_question_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'page/home_page.dart';
import 'page/position_select.dart';
import 'private/key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  for (final bigQuestions in questions) {
    print(
      '${bigQuestions.id},${bigQuestions.title},${bigQuestions.category.title}',
    );
    for (final bigQuestion in bigQuestions.questions) {
      for (final e in bigQuestion.questions) {
        print(
          ',,,${e.questionStatement},${e.choices.toString().replaceAll('[', '').replaceAll(']', '')},${e.correctAnswerIndex}',
        );
      }
    }
    print(',,,,,,,,');
  }
  return;
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: kDebugMode,
  );
  await runZonedGuarded(
    () async {
      runApp(
        ProviderScope(child: HomePage()),
      );
    },
    (error, stack) {
      log(error.toString(), name: 'ERROR', error: error, stackTrace: stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PositionSelectPage();
  }
}
