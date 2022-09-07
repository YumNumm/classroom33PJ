import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/db_provider.dart';

class WaitingPage extends HookConsumerWidget {
  const WaitingPage({
    this.message = 'しばらくお待ちください',
    this.child,
    super.key,
  });
  final String message;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 16),
            
            Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            child ?? const SizedBox.shrink(),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              ref.watch(selectedDeviceIdProvider).toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
