import 'package:freezed_annotation/freezed_annotation.dart';

part 'projector_state.freezed.dart';

@freezed
class ProjectorStateModel with _$ProjectorStateModel {
  factory ProjectorStateModel({
    required int projectorId,
  }) = _ProjectorStateModel;

  const ProjectorStateModel._();
}
