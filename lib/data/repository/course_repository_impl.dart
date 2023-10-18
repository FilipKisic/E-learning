import 'package:flutter_e_learning/data/api/course/course_api.dart';
import 'package:flutter_e_learning/data/mapper/get_course_dto_to_course_mapper.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseApi api;
  final GetCourseDtoToCourseMapper getCourseDtoToCourseMapper;

  const CourseRepositoryImpl(
    this.api,
    this.getCourseDtoToCourseMapper,
  );

  @override
  Future<List<Course>> getAll() async {
    final listOfCourseDtos = await api.getAll();
    return listOfCourseDtos
        .map((courseDto) => getCourseDtoToCourseMapper.convert(courseDto))
        .toList();
  }
}
