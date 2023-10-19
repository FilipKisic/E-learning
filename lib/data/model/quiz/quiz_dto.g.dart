// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) => QuizDto(
      title: json['title'] as String,
      lectureId: json['lectureId'] as int?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDtoToJson(QuizDto instance) => <String, dynamic>{
      'title': instance.title,
      'lectureId': instance.lectureId,
      'questions': instance.questions,
    };
