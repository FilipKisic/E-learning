import 'package:flutter_e_learning/data/mapper/mapper.dart';
import 'package:flutter_e_learning/data/model/course/get_course_dto.dart';
import 'package:flutter_e_learning/domain/entity/course.dart';

class GetCourseDtoToCourseMapper implements Mapper<GetCourseDto, Course> {
  @override
  Course convert(final GetCourseDto dto) {
    return Course(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      progressPercentage: dto.progress.percentage,
    );
  }
}
