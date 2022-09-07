import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../schema/state/state.dart';
import 'projector/onQuestion.dart';
import 'projector/waiting_page.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
        child: deviceStateStream.when<Widget>(
          data: ProjectorWidget.new,
          error: (error, stackTrace) => Center(child: Text('error: $error')),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
        },
        label: Text(deviceStateStream.value?.state.toString() ?? 'NULL STATE'),
      ),
    );
  }
}

/// 表示種別の切り替え
class PageSwitcher extends HookConsumerWidget {
  const PageSwitcher(this.item, {super.key});
  final DeviceStateItem item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(YumNumm): Projectorか、Registerか、結果表示か....
    //! DeviceStateの判別
    switch (item.state) {
      case DeviceState.waiting:
        return const WaitingPage(message: 'データを待機しています...');
      case DeviceState.running:
        if (item.isAccepted == true) {
          return const OnQuestionPage();
        } else {
          return WaitingPage(
            message: 'コントローラによる開始を待っています...',
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FloatingActionButton.extended(
                onPressed: () => SupabaseApi.updateDeviceStateItem(
                  item.state,
                  item.position,
                  isAccepted: true,
                ),
                label: const Text('強制開始'),
              ),
            ),
          );
        }
      case DeviceState.starting:
        return const WaitingPage(message: 'マスターによる開始を待っています...');
    }
  }
}

/// プロジェクターの場合
class ProjectorWidget extends HookConsumerWidget {
  const ProjectorWidget(this.item, {super.key});
  final DeviceStateItem item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:
              colorFromPosision(ref.watch(selectedDeviceIdProvider.notifier).state!),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Card(
          child: PageSwitcher(item),
        ),
      ),
    );
  }
}

List<Color> colorFromPosision(DevicePosition position) {
  switch (position) {
    case DevicePosition.projector1:
      return [
        const Color.fromARGB(255, 89, 191, 179),
        const Color.fromARGB(255, 65, 92, 179),
      ];
    case DevicePosition.projector2:
      return [
        const Color.fromARGB(255, 65, 92, 179),
        const Color.fromARGB(255, 179, 115, 179),
      ];
    case DevicePosition.projector3:
      return [
        const Color.fromARGB(255, 255, 114, 16),
        const Color.fromARGB(255, 191, 184, 43),
      ];
    default:
      return [
        const Color.fromARGB(255, 17, 91, 175),
        const Color.fromARGB(255, 73, 173, 255),
      ];
  }
}
