import 'package:json_annotation/json_annotation.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  final int? id;
  final String questionText;
  final String option1;
  final String option2;
  final String option3;
  final String correctOption4;
  final int? quizId;

  const QuestionDto({
    this.id,
    required this.questionText,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.correctOption4,
    this.quizId,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) => _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
}
