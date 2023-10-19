// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureDto _$LectureDtoFromJson(Map<String, dynamic> json) => LectureDto(
      title: json['title'] as String,
      description: json['description'] as String,
      courseId: json['courseId'] as int?,
      quizzes: (json['quizzes'] as List<dynamic>)
          .map((e) => QuizDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureDtoToJson(LectureDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'courseId': instance.courseId,
      'quizzes': instance.quizzes,
    };
