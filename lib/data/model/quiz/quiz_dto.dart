import 'package:flutter_e_learning/data/model/question/question_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_dto.g.dart';

@JsonSerializable()
class QuizDto {
  final String title;
  final int? lectureId;
  final List<QuestionDto> questions;

  const QuizDto({
    required this.title,
    this.lectureId,
    required this.questions,
  });

  factory QuizDto.fromJson(Map<String, dynamic> json) => _$QuizDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDtoToJson(this);
}
