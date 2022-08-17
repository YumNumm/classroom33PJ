import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WaitingPage extends HookConsumerWidget {
  const WaitingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: const [
        CircularProgressIndicator.adaptive(),
        SizedBox(height: 16),
        Text('待機中...'),
      ],
    );
  }
}
