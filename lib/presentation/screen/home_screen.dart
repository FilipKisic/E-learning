import 'package:flutter/material.dart';
import 'package:flutter_e_learning/di.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseListState = ref.watch(courseProvider.select((provider) => provider.courseList))!;

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
                  const Icon(Icons.add_circle_rounded, size: 38),
                ],
              ),
              courseListState.when(
                data: (courseList) => courseList.isEmpty
                    ? const Text("...")
                    : Expanded(
                      child: ListView.builder(
                          itemCount: courseList.length,
                          itemBuilder: (context, index) => Card(
                            child: Text(courseList[index].title),
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
}