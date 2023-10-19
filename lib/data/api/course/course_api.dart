import 'package:dio/dio.dart';
import 'package:flutter_e_learning/data/model/course/get_course_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'course_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080/api/course")
abstract class CourseApi {
  factory CourseApi(final Dio dio, {String baseUrl}) = _CourseApi;

  @GET("/all/{studentId}")
  Future<List<GetCourseDto>> getAll(@Path("studentId") final int studentId);
}