import 'package:flutter_e_learning/data/api/course/course_api.dart';
import 'package:flutter_e_learning/data/mapper/course_to_create_course_dto_mapper.dart';
import 'package:flutter_e_learning/data/mapper/get_course_dto_to_course_mapper.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseApi api;
  final GetCourseDtoToCourseMapper getCourseDtoToCourseMapper;
  final CourseToCreateCourseDtoMapper courseToCreateCourseDtoMapper;

  const CourseRepositoryImpl(
    this.api,
    this.getCourseDtoToCourseMapper,
    this.courseToCreateCourseDtoMapper,
  );

  @override
  Future<List<Course>> getAll(final int studentId) async {
    final listOfCourseDtos = await api.getAll(studentId);
    return listOfCourseDtos
        .map((courseDto) => getCourseDtoToCourseMapper.convert(courseDto))
        .toList();
  }

  @override
  Future<void> create(final Course course) async {
    final courseDto = courseToCreateCourseDtoMapper.convert(course);
    await api.create(courseDto);
  }
  
  @override
  Future<void> delete(final int id) => api.delete(id);
}
