import 'package:flutter/material.dart';
import 'package:flutter_e_learning/presentation/style/colors.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';

class CustomSnackBar {
  const CustomSnackBar._();

  static void show(BuildContext context, final String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_rounded, color: secondaryColor),
            const SizedBox(width: 5),
            Text(text, style: snackbarTextStyle),
          ],
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        elevation: 5,
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}