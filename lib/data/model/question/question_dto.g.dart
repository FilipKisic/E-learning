// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
      id: json['id'] as int?,
      questionText: json['questionText'] as String,
      option1: json['option1'] as String,
      option2: json['option2'] as String,
      option3: json['option3'] as String,
      correctOption4: json['correctOption4'] as String,
      quizId: json['quizId'] as int?,
    );

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionText': instance.questionText,
      'option1': instance.option1,
      'option2': instance.option2,
      'option3': instance.option3,
      'correctOption4': instance.correctOption4,
      'quizId': instance.quizId,
    };
