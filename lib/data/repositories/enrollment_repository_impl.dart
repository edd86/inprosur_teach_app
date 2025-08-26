import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/enrollments_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/course_mapper.dart';
import 'package:inprosur_teach_app/data/mappers/validating_mapper.dart';
import 'package:inprosur_teach_app/data/models/course_model.dart';
import 'package:inprosur_teach_app/data/models/validating_model.dart';
import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:inprosur_teach_app/domain/entities/validating_enity.dart';
import 'package:inprosur_teach_app/domain/repositories/enrollment_repository.dart';

class EnrollmentRepositoryImpl implements EnrollmentRepository {
  @override
  Future<ValidatingEnity> getStudentHasEnrollment(int id) async {
    final dio = Dio();
    final res = await dio.get(getStundentHasEnrollmentUrl(id));
    return ValidatingMapper.toEntity(ValidatingModel.fromJson(res.data));
  }

  @override
  Future<ValidatingEnity> studentEnrolledInCourse(
    int studentId,
    int courseId,
  ) async {
    final dio = Dio();
    final result = await dio.get(
      getStudentHasEnrolledCoursesUrl(studentId, courseId),
    );
    return ValidatingMapper.toEntity(ValidatingModel.fromJson(result.data));
  }

  @override
  Future<List<CourseEntity>> getStudentEnrolledCourses(int studentId) async {
    final dio = Dio();
    final List<CourseEntity> courses = [];
    final res = await dio.get(getStudentEnrolledCoursesUrl(studentId));
    final coursesResponse = res.data['data'];
    coursesResponse.map(
      (course) =>
          courses.add(CourseMapper.modelToEntity(CourseModel.fromJson(course))),
    );
    return courses;
  }
}
