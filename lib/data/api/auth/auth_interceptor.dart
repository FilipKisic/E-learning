import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_e_learning/data/repository/auth_repository_impl.dart';

class AuthInterceptor extends InterceptorsWrapper {
  
  @override
  void onRequest(final RequestOptions options, final RequestInterceptorHandler handler) async {
    final token = AccessToken.accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
    }
    return handler.next(options);
  }
}
