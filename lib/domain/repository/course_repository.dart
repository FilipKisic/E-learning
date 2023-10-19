import 'package:flutter_e_learning/domain/entity/course.dart';

abstract interface class CourseRepository {
  Future<List<Course>> getAll(int studentId);
}