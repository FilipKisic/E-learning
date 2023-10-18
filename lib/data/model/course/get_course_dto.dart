import 'package:flutter_e_learning/data/model/progress/progress_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_course_dto.g.dart';

@JsonSerializable()
class GetCourseDto {
  final int id;
  final String title;
  final String description;
  final ProgressDto progress;

  const GetCourseDto({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
  });

  factory GetCourseDto.fromJson(Map<String, dynamic> json) => _$GetCourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCourseDtoToJson(this);
}
