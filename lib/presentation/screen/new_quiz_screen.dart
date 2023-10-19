import 'package:flutter/material.dart';
import 'package:flutter_e_learning/domain/entity/question.dart';
import 'package:flutter_e_learning/domain/entity/quiz.dart';
import 'package:flutter_e_learning/presentation/screen/new_lecture_screen.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_e_learning/presentation/widget/custom_button.dart';
import 'package:flutter_e_learning/presentation/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewQuizScreen extends HookConsumerWidget {
  const NewQuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final questionController = useTextEditingController();
    final firstOptionController = useTextEditingController();
    final secondOptionController = useTextEditingController();
    final thirdOptionController = useTextEditingController();
    final correctAnswearController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.addQuiz,
                style: titleTextStyle,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: titleController,
                labelText: AppLocalizations.of(context)!.quizTitle,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              CustomTextField(
                controller: questionController,
                labelText: AppLocalizations.of(context)!.question,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: firstOptionController,
                labelText: AppLocalizations.of(context)!.firstOption,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: secondOptionController,
                labelText: AppLocalizations.of(context)!.secondOption,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: thirdOptionController,
                labelText: AppLocalizations.of(context)!.thirdOption,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: correctAnswearController,
                labelText: AppLocalizations.of(context)!.correctAnswear,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: AppLocalizations.of(context)!.next,
                  onPressed: () => _submitQuiz(
                    context,
                    titleController.text,
                    questionController.text,
                    firstOptionController.text,
                    secondOptionController.text,
                    thirdOptionController.text,
                    correctAnswearController.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitQuiz(
    final BuildContext context,
    final String title,
    final String question,
    final String firstOption,
    final String secondOption,
    final String thirdOption,
    final String correctAnswear,
  ) {
    final newQuestion = Question(
      question: question,
      firstOption: firstOption,
      secondOption: secondOption,
      thirdOption: thirdOption,
      correctAnswear: correctAnswear,
    );
    final quiz = Quiz(title: title, description: 'Generic description', questions: [newQuestion]);
    _redirectToNewLectureScreen(context, quiz);
  }

  void _redirectToNewLectureScreen(BuildContext context, final Quiz quiz) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const NewLectureScreen(),
          settings: RouteSettings(arguments: quiz),
        ),
      );
}
