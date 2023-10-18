import 'package:flutter_e_learning/data/model/auth/auth_request_dto.dart';
import 'package:flutter_e_learning/data/model/auth/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080/auth")
abstract class AuthApi {
  factory AuthApi(final Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/login")
  Future<AuthResponseDto> login(@Body() final AuthRequestDto request);
}