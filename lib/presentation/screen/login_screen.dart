import 'package:flutter/material.dart';
import 'package:flutter_e_learning/core/routes/route_generator.dart';
import 'package:flutter_e_learning/di.dart';
import 'package:flutter_e_learning/presentation/style/text_styles.dart';
import 'package:flutter_e_learning/presentation/widget/custom_button.dart';
import 'package:flutter_e_learning/presentation/widget/custom_snack_bar.dart';
import 'package:flutter_e_learning/presentation/widget/custom_text_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends HookConsumerWidget {
  final _fromKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final loginState = ref.watch(studentProvider.select((provider) => provider.loginState));

    ref.listen(studentProvider.select((provider) => provider.loginState), (_, state) {
      state?.whenOrNull(
        data: (_) => WidgetsBinding.instance.addPostFrameCallback(
          (_) => Navigator.of(context).pushReplacementNamed(RouteGenerator.homeScreen),
        ),
        error: (error, _) => WidgetsBinding.instance.addPostFrameCallback(
          (_) => CustomSnackBar.show(context, error.toString()),
        ),
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.login, style: titleTextStyle),
                const SizedBox(height: 60),
                CustomTextField(
                  controller: usernameController,
                  labelText: AppLocalizations.of(context)!.username,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  labelText: AppLocalizations.of(context)!.password,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: AppLocalizations.of(context)!.login,
                    isLoading: loginState is AsyncLoading<void>,
                    onPressed: () => login(
                      ref,
                      usernameController.text,
                      passwordController.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(final WidgetRef ref, final String username, final String password) {
    ref.read(studentProvider).login(username, password);
  }
}
