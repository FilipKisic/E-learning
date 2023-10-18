import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/domain/repository/course_repository.dart';

class GetAllCoursesUseCase {
  final CourseRepository courseRepository;

  const GetAllCoursesUseCase(this.courseRepository);

  Future<List<Course>> call() => courseRepository.getAll();
}