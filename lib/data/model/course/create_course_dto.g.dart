// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCourseDto _$CreateCourseDtoFromJson(Map<String, dynamic> json) =>
    CreateCourseDto(
      title: json['title'] as String,
      description: json['description'] as String,
      lectures: (json['lectures'] as List<dynamic>)
          .map((e) => LectureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateCourseDtoToJson(CreateCourseDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'lectures': instance.lectures,
    };
