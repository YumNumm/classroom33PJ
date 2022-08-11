import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';

part 'question_model.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    required String title,
    required int category_id,
    // TODO(YumNumm): Need Improve
    required Map<String, dynamic> data,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
