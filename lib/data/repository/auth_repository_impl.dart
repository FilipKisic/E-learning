import 'package:flutter_e_learning/data/api/auth/auth_api.dart';
import 'package:flutter_e_learning/data/model/auth/auth_request_dto.dart';
import 'package:flutter_e_learning/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;

  const AuthRepositoryImpl(this.api);

  @override
  Future<void> login(final String email, final String password) async {
    final authRequestDto = AuthRequestDto(username: email, password: password);
    final response = await api.login(authRequestDto);
    print("RESPONSE: ${response.accessToken}");
    AccessToken.setAccessToken(response.accessToken);
  }
}

class AccessToken {
  static String? accessToken;

  static setAccessToken(final String token) => accessToken = token;
}
