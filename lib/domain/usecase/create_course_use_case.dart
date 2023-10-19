import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/domain/repository/course_repository.dart';

class CreateCourseUseCase {
  final CourseRepository courseRepository;

  CreateCourseUseCase(this.courseRepository);

  Future<void> call(final Course course) => courseRepository.create(course);
}