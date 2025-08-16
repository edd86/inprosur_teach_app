import 'package:inprosur_teach_app/domain/entities/student_entity.dart';
import 'package:inprosur_teach_app/domain/entities/validating_enity.dart';

abstract class StudentRepository {
  Future<StudentEntity?> getStudentByUserId(int userId);
  Future<StudentEntity?> registerStudent(StudentEntity student);
  Future<ValidatingEnity> studentEnrolledInCourse(int studentId, int courseId);
}
