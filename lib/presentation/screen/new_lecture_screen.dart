import 'package:flutter/material.dart';
import 'package:flutter_e_learning/domain/entity/lecture.dart';
import 'package:flutter_e_learning/domain/entity/quiz.dart';
import 'package:flutter_e_learning/presentation/screen/new_course_screen.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_e_learning/presentation/widget/custom_button.dart';
import 'package:flutter_e_learning/presentation/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewLectureScreen extends HookConsumerWidget {
  const NewLectureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;

    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.addLecture,
                style: titleTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: titleController,
                labelText: AppLocalizations.of(context)!.title,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: descriptionController,
                labelText: AppLocalizations.of(context)!.description,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: AppLocalizations.of(context)!.next,
                  onPressed: () => _submitLecture(
                    context,
                    titleController.text,
                    descriptionController.text,
                    quiz,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitLecture(
      BuildContext context, final String title, final String description, final Quiz quiz) {
    final lecture = Lecture(title: title, description: description, quizzes: [quiz]);
    _redirectToNewCourseScreen(context, lecture);
  }

  void _redirectToNewCourseScreen(BuildContext context, final Lecture lecture) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const NewCourseScreen(),
          settings: RouteSettings(arguments: lecture),
        ),
      );
}
