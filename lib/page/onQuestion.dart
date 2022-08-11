import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnQuestionPage extends HookConsumerWidget {
  const OnQuestionPage(
    this.projecorId, {
    super.key,
  });
  final int projecorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(
          'OnQuestionPage\n'
          '$projecorId',
        ),
      ),
    );
  }
}
