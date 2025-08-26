import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:inprosur_teach_app/domain/entities/validating_enity.dart';

abstract class EnrollmentRepository {
  Future<ValidatingEnity> getStudentHasEnrollment(int id);
  Future<ValidatingEnity> studentEnrolledInCourse(int studentId, int courseId);
  Future<List<CourseEntity>> getStudentEnrolledCourses(int studentId);
}
