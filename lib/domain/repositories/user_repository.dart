import 'package:firebase_auth/firebase_auth.dart';
import 'package:inprosur_teach_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> createUser(UserEntity newUser);
  Future<UserCredential> signInWithGoogle();
  Future<UserEntity> getUserByEmail(String email);
}
