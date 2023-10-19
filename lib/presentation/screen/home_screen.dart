import 'package:flutter/material.dart';
import 'package:flutter_e_learning/core/routes/route_generator.dart';
import 'package:flutter_e_learning/di.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_e_learning/presentation/widget/course/course_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentId = ref.watch(studentProvider.select((provider) => provider.currentStudentId));
    final courseListState = ref.watch(courseProvider(studentId).select((provider) => provider.courseList))!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.courses, style: titleTextStyle),
                  IconButton(
                    icon: const Icon(Icons.add_circle_rounded, size: 38),
                    onPressed: () => _redirectToNewQuizScreen(context),
                  ),
                ],
              ),
              courseListState.when(
                data: (courseList) => courseList.isEmpty
                    ? const Text("...")
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.separated(
                            itemCount: courseList.length,
                            separatorBuilder: (_, index) => const SizedBox(height: 25),
                            itemBuilder: (context, index) => CourseCard(
                              course: courseList[index],
                            ),
                          ),
                        ),
                      ),
                error: (error, _) => Center(child: Text(error.toString())),
                loading: () => const CircularProgressIndicator.adaptive(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _redirectToNewQuizScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.newQuizScreen);
}
