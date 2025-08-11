import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/variables/global_variables.dart';
import 'package:inprosur_teach_app/data/repositories/student_repository_impl.dart';
import 'package:inprosur_teach_app/data/repositories/user_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/user_entity.dart';

final authProvider = StateNotifierProvider<AuthNotifier, UserEntity?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<UserEntity?> {
  AuthNotifier() : super(null) {
    _init();
  }

  void setUser(UserEntity user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }

  void _init() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final user = await UserRepositoryImpl().getUserByEmail(
        currentUser.email!,
      );
      studentLogued = await StudentRepositoryImpl().getStudentByUserId(
        user.id!,
      );
      state = user;
    }
  }
}
