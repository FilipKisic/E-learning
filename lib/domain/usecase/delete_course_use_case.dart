import 'package:flutter_e_learning/domain/repository/course_repository.dart';

class DeleteCourseUseCase {
  final CourseRepository courseRepository;

  const DeleteCourseUseCase(this.courseRepository);

  Future<void> call(final int id) => courseRepository.delete(id);
}
