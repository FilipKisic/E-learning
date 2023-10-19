import 'package:flutter/material.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/domain/usecase/create_course_use_case.dart';
import 'package:flutter_e_learning/domain/usecase/delete_course_use_case.dart';
import 'package:flutter_e_learning/domain/usecase/get_all_courses_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CourseProvider extends ChangeNotifier {
  final GetAllCoursesUseCase getAllCoursesUseCase;
  final CreateCourseUseCase createCourseUseCase;
  final DeleteCourseUseCase deleteCourseUseCase;

  CourseProvider(
    this.getAllCoursesUseCase,
    this.createCourseUseCase,
    this.deleteCourseUseCase,
    int studentId,
  ) {
    getAll(studentId);
  }

  AsyncValue<List<Course>>? courseList;

  void getAll(final int studentId) async {
    courseList = const AsyncValue.loading();
    notifyListeners();

    courseList = await AsyncValue.guard(() => getAllCoursesUseCase(studentId));
    notifyListeners();
  }

  void create(final Course course, final int studentId) async {
    await createCourseUseCase(course);
    getAll(studentId);
  }

  void delete(final int courseId, final int studentId) async {
    await deleteCourseUseCase(courseId);
    getAll(studentId);
  }
}
