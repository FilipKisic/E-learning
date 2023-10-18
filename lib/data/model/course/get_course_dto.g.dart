// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCourseDto _$GetCourseDtoFromJson(Map<String, dynamic> json) => GetCourseDto(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      progress: ProgressDto.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCourseDtoToJson(GetCourseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'progress': instance.progress,
    };
