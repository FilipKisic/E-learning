import 'package:flutter/material.dart';
import 'package:flutter_e_learning/domain/usecase/authenitcate_user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudentProvider extends ChangeNotifier {
  final AuthenticateUserUseCase authUseCase;

  StudentProvider(this.authUseCase);

  AsyncValue<bool>? loginState;
  int currentStudentId = 1;

  void login(final String username, final String password) async {
    loginState = const AsyncValue.loading();
    notifyListeners();
    
    await Future.delayed(const Duration(seconds: 1));

    try {
      await authUseCase.login(username, password);
      loginState = const AsyncValue.data(true);
    } catch (error) {
      loginState = AsyncValue.error(error, StackTrace.current);
    }
    notifyListeners();
  }
}
