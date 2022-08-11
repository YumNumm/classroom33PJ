import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projector/page/onQuestion.dart';

class RootPage extends StatefulHookConsumerWidget {
  const RootPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final projectorId = useState<int?>(null);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  onChanged: (value) {
                    projectorId.value = int.tryParse(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'ProjectorId',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FloatingActionButton.extended(
                onPressed: () async {
                  if (projectorId.value != null) {
                    await Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (context) => OnQuestionPage(
                          projectorId.value!,
                        ),
                      ),
                    );
                  }
                },
                label: const Text('Connect'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
