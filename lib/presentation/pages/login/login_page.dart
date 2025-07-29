import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inprosur_teach_app/core/constants/app_routes.dart';
import 'package:inprosur_teach_app/data/repositories/user_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/user_entity.dart';
import 'package:inprosur_teach_app/presentation/providers/auth_provider.dart';
import 'package:inprosur_teach_app/presentation/providers/manual_loading_provider.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 1.5.h,
            horizontal: 2.5.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Bienvenido', style: TextStyle(fontSize: 17.5.sp)),
              SvgPicture.asset('assets/svg/inprosur.svg', height: 65.h),
              SizedBox(
                height: 4.5.h,
                width: double.infinity,
                child: ElevatedButton.icon(
                  label: Text(
                    'Iniciar sesión con Google',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  icon: SvgPicture.asset(
                    'assets/svg/google.svg',
                    height: 17.sp,
                  ),
                  onPressed: () async {
                    final loadingNotifier = ref.read(
                      manualLoadingProvider.notifier,
                    );
                    loadingNotifier.state = true;
                    try {
                      final credential = await UserRepositoryImpl()
                          .signInWithGoogle();
                      if (credential.additionalUserInfo!.isNewUser) {
                        final userUid = credential.user!.uid;
                        final newUser = await UserRepositoryImpl().createUser(
                          UserEntity(
                            username: credential.user!.displayName!,
                            email: credential.user!.email!,
                            password: userUid,
                            uId: userUid,
                            photoUrl: credential.user!.photoURL ?? '',
                          ),
                        );
                        if (newUser != null) {
                          _showCustomMessage(
                            'Usuario registrado correctamente',
                          );
                          ref.read(authProvider.notifier).setUser(newUser);
                          if (credential.additionalUserInfo!.isNewUser) {
                            _navigate(
                              AppRoutes.studentData,
                              userId: newUser.id,
                            );
                          } else {
                            _navigate(AppRoutes.homePage);
                          }
                        }
                      } else {
                        final user = await UserRepositoryImpl().getUserByEmail(
                          credential.user!.email!,
                        );
                        ref.read(authProvider.notifier).setUser(user);
                        _showCustomMessage('Sesión iniciada');
                        _navigate(AppRoutes.homePage);
                      }
                    } catch (e) {
                      _showCustomMessage(
                        'No se pudo registrar: ${e.toString()}',
                      );
                      print(e.toString());
                    } finally {
                      loadingNotifier.state = false;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCustomMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _navigate(String route, {int? userId}) {
    if (userId != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        route,
        arguments: userId,
        (route) => false,
      );
    }
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
