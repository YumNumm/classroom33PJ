import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectionPage extends StatefulHookConsumerWidget {
  const ConnectionPage({
    required this.id,
    super.key,
  });
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends ConsumerState<ConnectionPage> {

  @override
  void initState() {
    // DBに接続
    super.initState();
    // ref.read(localStateController.notifier).startSubscription();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
