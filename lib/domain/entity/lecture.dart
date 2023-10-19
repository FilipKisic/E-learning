import 'package:flutter_e_learning/domain/entity/quiz.dart';

class Lecture {
  final int? id;
  final String title;
  final String description;
  final List<Quiz> quizzes;

  const Lecture({
    this.id,
    required this.title,
    required this.description,
    required this.quizzes,
  });

  @override
  String toString() => "$id, $title, $description, $quizzes";
}
