import 'package:dio/dio.dart';
import 'package:flutter_e_learning/data/api/auth/auth_api.dart';
import 'package:flutter_e_learning/data/api/auth/auth_interceptor.dart';
import 'package:flutter_e_learning/data/api/course/course_api.dart';
import 'package:flutter_e_learning/data/mapper/course_to_create_course_dto_mapper.dart';
import 'package:flutter_e_learning/data/mapper/get_course_dto_to_course_mapper.dart';
import 'package:flutter_e_learning/data/mapper/lecture_entity_to_dto_mapper.dart';
import 'package:flutter_e_learning/data/mapper/question_entity_to_dto_mapper.dart';
import 'package:flutter_e_learning/data/mapper/quiz_entity_to_dto_mapper.dart';
import 'package:flutter_e_learning/data/repository/auth_repository_impl.dart';
import 'package:flutter_e_learning/data/repository/course_repository_impl.dart';
import 'package:flutter_e_learning/domain/repository/auth_repository.dart';
import 'package:flutter_e_learning/domain/repository/course_repository.dart';
import 'package:flutter_e_learning/domain/usecase/authenitcate_user_use_case.dart';
import 'package:flutter_e_learning/domain/usecase/create_course_use_case.dart';
import 'package:flutter_e_learning/domain/usecase/delete_course_use_case.dart';
import 'package:flutter_e_learning/domain/usecase/get_all_courses_use_case.dart';
import 'package:flutter_e_learning/presentation/riverpod/course_provider.dart';
import 'package:flutter_e_learning/presentation/riverpod/student_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// *********** EXTERNAL  *********** //
final dioProvider = Provider<Dio>(
  (ref) => Dio()..interceptors.add(AuthInterceptor()),
);

// *********** DATA SOURCE *********** //
final authApiProvider = Provider<AuthApi>(
  (ref) => AuthApi(ref.watch(dioProvider)),
);

final courseApiProvider = Provider<CourseApi>(
  (ref) => CourseApi(ref.watch(dioProvider)),
);

// *********** MAPPER *********** //
final getCourseDtoToCourseMapperProvider = Provider<GetCourseDtoToCourseMapper>(
  (ref) => GetCourseDtoToCourseMapper(),
);

final questionEntityToDtoMapperProvider = Provider<QuestionEntityToDtoMapper>(
  (ref) => QuestionEntityToDtoMapper(),
);

final quizEntityToDtoMapperProvider = Provider<QuizEntityToDtoMapper>(
  (ref) => QuizEntityToDtoMapper(ref.watch(questionEntityToDtoMapperProvider)),
);

final lectureEntityToDtoMapperProvder = Provider<LectureEntityToDtoMapper>(
  (ref) => LectureEntityToDtoMapper(ref.watch(quizEntityToDtoMapperProvider)),
);

final courseToCreateCourseDtoMapperProvider = Provider<CourseToCreateCourseDtoMapper>(
  (ref) => CourseToCreateCourseDtoMapper(ref.watch(lectureEntityToDtoMapperProvder)),
);

// *********** REPOSITORY *********** //
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authApiProvider)),
);

final courseRepositoryProvider = Provider<CourseRepository>(
  (ref) => CourseRepositoryImpl(
      ref.watch(courseApiProvider),
      ref.watch(getCourseDtoToCourseMapperProvider),
      ref.watch(courseToCreateCourseDtoMapperProvider)),
);

// *********** USE CASE *********** //
final authUseCaseProvider = Provider<AuthenticateUserUseCase>(
  (ref) => AuthenticateUserUseCase(ref.watch(authRepositoryProvider)),
);

final getAllCoursesUseCaseProvider = Provider<GetAllCoursesUseCase>(
  (ref) => GetAllCoursesUseCase(ref.watch(courseRepositoryProvider)),
);

final createCourseUseCaseProvider = Provider<CreateCourseUseCase>(
    (ref) => CreateCourseUseCase(ref.watch(courseRepositoryProvider)));

final deleteCourseUseCaseProvider = Provider<DeleteCourseUseCase>(
    (ref) => DeleteCourseUseCase(ref.watch(courseRepositoryProvider)));

// *********** PROVIDER *********** //
final studentProvider = ChangeNotifierProvider<StudentProvider>(
  (ref) => StudentProvider(ref.read(authUseCaseProvider)),
);

final courseProvider = ChangeNotifierProvider.family<CourseProvider, int>(
  (ref, id) => CourseProvider(
    ref.watch(getAllCoursesUseCaseProvider),
    ref.watch(createCourseUseCaseProvider),
    ref.watch(deleteCourseUseCaseProvider),
    id,
  ),
);
