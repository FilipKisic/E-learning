import 'package:flutter_e_learning/data/mapper/mapper.dart';
import 'package:flutter_e_learning/data/model/question/question_dto.dart';
import 'package:flutter_e_learning/domain/entity/question.dart';

class QuestionEntityToDtoMapper implements Mapper<Question, QuestionDto> {
  @override
  QuestionDto convert(final Question entity) {
    return QuestionDto(
      questionText: entity.question,
      option1: entity.firstOption,
      option2: entity.secondOption,
      option3: entity.thirdOption,
      correctOption4: entity.correctAnswear,
    );
  }
}
