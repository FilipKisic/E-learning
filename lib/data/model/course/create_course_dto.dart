import 'package:flutter_e_learning/data/model/lecture/lecture_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_course_dto.g.dart';

@JsonSerializable()
class CreateCourseDto {
  final String title;
  final String description;
  final List<LectureDto> lectures;

  const CreateCourseDto({
    required this.title,
    required this.description,
    required this.lectures,
  });

  factory CreateCourseDto.fromJson(Map<String, dynamic> json) => _$CreateCourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCourseDtoToJson(this);
}
