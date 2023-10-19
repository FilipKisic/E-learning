import 'package:flutter_e_learning/domain/entity/lecture.dart';

class Course {
  final int? id;
  final String title;
  final String description;
  final int? progressPercentage;
  final List<Lecture>? lectures;

  const Course({
    this.id,
    required this.title,
    required this.description,
    this.progressPercentage,
    this.lectures,
  });

  @override
  String toString() => "$id, $title, $description, $progressPercentage, $lectures";
}
