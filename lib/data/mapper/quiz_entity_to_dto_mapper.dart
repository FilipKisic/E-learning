import 'package:flutter_e_learning/data/mapper/mapper.dart';
import 'package:flutter_e_learning/data/mapper/question_entity_to_dto_mapper.dart';
import 'package:flutter_e_learning/data/model/quiz/quiz_dto.dart';
import 'package:flutter_e_learning/domain/entity/quiz.dart';

class QuizEntityToDtoMapper implements Mapper<Quiz, QuizDto> {
  final QuestionEntityToDtoMapper _entityToDtoMapper;

  const QuizEntityToDtoMapper(this._entityToDtoMapper);

  @override
  QuizDto convert(final Quiz entity) {
    final questions =
        entity.questions.map((question) => _entityToDtoMapper.convert(question)).toList();
    return QuizDto(
      title: entity.title,
      questions: questions,
    );
  }
}
