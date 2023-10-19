import 'package:flutter_e_learning/data/mapper/lecture_entity_to_dto_mapper.dart';
import 'package:flutter_e_learning/data/mapper/mapper.dart';
import 'package:flutter_e_learning/data/model/course/create_course_dto.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';

class CourseToCreateCourseDtoMapper implements Mapper<Course, CreateCourseDto> {
  final LectureEntityToDtoMapper _entityToDtoMapper;

  const CourseToCreateCourseDtoMapper(this._entityToDtoMapper);

  @override
  CreateCourseDto convert(final Course entity) {
    final lectures =
        entity.lectures!.map((lecture) => _entityToDtoMapper.convert(lecture)).toList();
    return CreateCourseDto(
      title: entity.title,
      description: entity.description,
      lectures: lectures,
    );
  }
}
