import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/student_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/student_mapper.dart';
import 'package:inprosur_teach_app/data/mappers/validating_mapper.dart';
import 'package:inprosur_teach_app/data/models/student_model.dart';
import 'package:inprosur_teach_app/data/models/validating_model.dart';
import 'package:inprosur_teach_app/domain/entities/student_entity.dart';
import 'package:inprosur_teach_app/domain/entities/validating_enity.dart';
import 'package:inprosur_teach_app/domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<StudentEntity?> getStudentByUserId(int userId) async {
    final dio = Dio();
    final result = await dio.get(getStudentByUserIdUrl(userId));
    final data = result.data['data'];
    if (data == null) {
      return null;
    }
    return StudentMapper.toEntity(StudentModel.fromMap(data));
  }

  @override
  Future<StudentEntity?> registerStudent(StudentEntity studentEntity) async {
    final dio = Dio();
    final result = await dio.post(
      registerStudentUrl,
      data: StudentMapper.toModel(studentEntity).toJson(),
    );
    final student = result.data['data'];
    return StudentMapper.toEntity(StudentModel.fromMap(student));
  }

  @override
  Future<ValidatingEnity> studentEnrolledInCourse(
    int studentId,
    int courseId,
  ) async {
    final dio = Dio();
    final result = await dio.get(
      getStudentEnrolledCoursesUrl(studentId, courseId),
    );
    return ValidatingMapper.toEntity(ValidatingModel.fromJson(result.data));
  }
}
