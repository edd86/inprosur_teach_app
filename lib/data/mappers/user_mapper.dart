import 'package:inprosur_teach_app/data/models/user_model.dart';
import 'package:inprosur_teach_app/domain/entities/user_entity.dart';

class UserMapper {
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      password: entity.password,
      photoUrl: entity.photoUrl,
      status: entity.status,
      uId: entity.uId,
      createdAt: entity.createdAt,
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      username: model.username,
      email: model.email,
      password: model.password,
      photoUrl: model.photoUrl,
      status: model.status,
      uId: model.uId,
      createdAt: model.createdAt,
    );
  }
}
