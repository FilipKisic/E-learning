import 'package:flutter_e_learning/domain/repository/auth_repository.dart';

class AuthenticateUserUseCase {
  final AuthRepository authRepository;

  const AuthenticateUserUseCase(this.authRepository);

  Future<void> login(final String username, final String password) =>
      authRepository.login(username, password);
}
