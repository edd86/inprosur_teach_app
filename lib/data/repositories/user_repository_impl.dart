import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inprosur_teach_app/data/datasources/sources/user_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/user_mapper.dart';
import 'package:inprosur_teach_app/data/models/user_model.dart';
import 'package:inprosur_teach_app/domain/entities/user_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final WidgetRef? ref;

  UserRepositoryImpl([this.ref]);

  @override
  Future<UserEntity?> createUser(UserEntity newUser) async {
    final dio = Dio();
    final response = await dio.post(
      createUserUrl,
      data: UserMapper.toModel(newUser).toMap(),
    );
    if (response.data['success']) {
      return UserMapper.toEntity(UserModel.fromMap(response.data['user']));
    } else {
      return null;
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserEntity> getUserByEmail(String email) async {
    final dio = Dio();
    final response = await dio.get(getUserByEmailUrl(email));
    return UserMapper.toEntity(UserModel.fromMap(response.data['data']));
  }
}
