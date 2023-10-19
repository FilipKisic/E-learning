import 'package:flutter_e_learning/data/model/quiz/quiz_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lecture_dto.g.dart';

@JsonSerializable()
class LectureDto {
  final String title;
  final String description;
  final int? courseId;
  final List<QuizDto> quizzes;

  const LectureDto({
    required this.title,
    required this.description,
    this.courseId,
    required this.quizzes,
  });

  factory LectureDto.fromJson(Map<String, dynamic> json) => _$LectureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDtoToJson(this);
}
