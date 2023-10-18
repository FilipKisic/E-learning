import 'package:flutter/material.dart';
import 'package:flutter_e_learning/presentation/style/colors.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgressBar extends StatelessWidget {
  final int progressPercentage;

  const ProgressBar({super.key, required this.progressPercentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppLocalizations.of(context)!.progress, style: progressBarTextStyle),
        const SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: progressPercentage / 100,
            backgroundColor: shadowColor,
            color: secondaryColor,
          ),
        ),
        const SizedBox(width: 10),
        Text('$progressPercentage%', style: progressBarTextStyle),
      ],
    );
  }
}
