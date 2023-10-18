// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressDto _$ProgressDtoFromJson(Map<String, dynamic> json) => ProgressDto(
      id: json['id'] as int,
      studentId: json['studentId'] as int,
      courseId: json['courseId'] as int,
      percentage: json['percentage'] as int,
    );

Map<String, dynamic> _$ProgressDtoToJson(ProgressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'courseId': instance.courseId,
      'percentage': instance.percentage,
    };
