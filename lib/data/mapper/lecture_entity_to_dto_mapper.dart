import 'package:flutter_e_learning/data/mapper/mapper.dart';
import 'package:flutter_e_learning/data/mapper/quiz_entity_to_dto_mapper.dart';
import 'package:flutter_e_learning/data/model/lecture/lecture_dto.dart';
import 'package:flutter_e_learning/domain/entity/lecture.dart';

class LectureEntityToDtoMapper implements Mapper<Lecture, LectureDto> {
  final QuizEntityToDtoMapper _entityToDtoMapper;

  const LectureEntityToDtoMapper(this._entityToDtoMapper);

  @override
  LectureDto convert(final Lecture entity) {
    final quizzes = entity.quizzes.map((quiz) => _entityToDtoMapper.convert(quiz)).toList();
    return LectureDto(
      title: entity.title,
      description: entity.description,
      quizzes: quizzes,
    );
  }
}
