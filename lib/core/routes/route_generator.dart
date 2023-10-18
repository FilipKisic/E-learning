import 'package:flutter/material.dart';
import 'package:flutter_e_learning/presentation/screen/home_screen.dart';
import 'package:flutter_e_learning/presentation/screen/login_screen.dart';
import 'package:flutter_e_learning/presentation/screen/new_course_screen.dart';
import 'package:flutter_e_learning/presentation/screen/new_lecture_screen.dart';
import 'package:flutter_e_learning/presentation/screen/new_quiz_screen.dart';

class RouteGenerator {
  static const loginScreen = '/';
  static const homeScreen = '/home';
  static const newQuizScreen = '/newQuiz';
  static const newLectureScreen = '/newLecture';
  static const newCourseScreen = '/newCourse';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case newQuizScreen:
        return MaterialPageRoute(builder: (_) => const NewQuizScreen());
      case newLectureScreen:
        return MaterialPageRoute(builder: (_) => const NewLectureScreen());
      case newCourseScreen:
        return MaterialPageRoute(builder: (_) => const NewCourseScreen());
      default:
        throw Exception('Route not found...');
    }
  }
}
