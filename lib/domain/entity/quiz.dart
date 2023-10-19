import 'package:flutter_e_learning/domain/entity/question.dart';

class Quiz {
  final int? id;
  final String title;
  final String description;
  final List<Question> questions;

  const Quiz({
    this.id,
    required this.title,
    required this.description,
    required this.questions,
  });

  @override
  String toString() => "$id, $title, $description, $questions";
}
