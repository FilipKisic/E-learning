import 'package:flutter/material.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/domain/usecase/get_all_courses_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CourseProvider extends ChangeNotifier {
  final GetAllCoursesUseCase getAllCoursesUseCase;

  CourseProvider(this.getAllCoursesUseCase) {
    getAll();
  }

  AsyncValue<List<Course>>? courseList;

  void getAll() async {
    courseList = const AsyncValue.loading();
    notifyListeners();

    courseList = await AsyncValue.guard(() => getAllCoursesUseCase());
    notifyListeners();
  }
}
