import 'package:inprosur_teach_app/domain/entities/student_entity.dart';

abstract class StudentRepository {
  Future<StudentEntity?> getStudentByUserId(int userId);
  Future<StudentEntity?> registerStudent(StudentEntity student);
}
