import 'package:inprosur_teach_app/data/models/student_model.dart';
import 'package:inprosur_teach_app/domain/entities/student_entity.dart';

class StudentMapper {
  static StudentModel toModel(StudentEntity entity) {
    return StudentModel(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      fingerprint: entity.fingerprint,
      userId: entity.userId,
      createdAt: entity.createdAt,
    );
  }

  static StudentEntity toEntity(StudentModel model) {
    return StudentEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      address: model.address,
      fingerprint: model.fingerprint,
      userId: model.userId,
      createdAt: model.createdAt,
    );
  }
}
