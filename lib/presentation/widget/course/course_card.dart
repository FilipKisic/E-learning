import 'package:flutter/material.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';
import 'package:flutter_e_learning/presentation/style/colors.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_e_learning/presentation/widget/course/progress_bar.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: shadowColor,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(course.title, style: cardTitleTextStyle),
          const SizedBox(height: 5),
          Text(course.description),
          const SizedBox(height: 5),
          ProgressBar(progressPercentage: course.progressPercentage),
        ],
      ),
    );
  }
}
