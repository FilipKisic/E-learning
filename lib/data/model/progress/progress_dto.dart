import 'package:json_annotation/json_annotation.dart';

part 'progress_dto.g.dart';

@JsonSerializable()
class ProgressDto {
  final int id;
  final int studentId;
  final int courseId;
  final int percentage;

  const ProgressDto({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.percentage,
  });

  factory ProgressDto.fromJson(Map<String, dynamic> json) => _$ProgressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressDtoToJson(this);
}
