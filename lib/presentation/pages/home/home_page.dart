import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/core/constants/app_routes.dart';
import 'package:inprosur_teach_app/core/utils/utils.dart';
import 'package:inprosur_teach_app/data/repositories/course_repository_impl.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/course_page.dart';
import 'package:inprosur_teach_app/presentation/pages/home/widgets/advertising_carousel.dart';
import 'package:inprosur_teach_app/presentation/providers/auth_provider.dart';
import 'package:inprosur_teach_app/presentation/providers/degree_provider.dart';
import 'package:inprosur_teach_app/presentation/providers/theme_provider.dart';
import 'package:inprosur_teach_app/presentation/widgets/courses_home_card.dart';
import 'package:inprosur_teach_app/presentation/widgets/option_card.dart';
import 'package:sizer/sizer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final degreeAsync = ref.watch(degreesProvider);
    final isDarkMode = ref.watch(themeProvider);
    final userLogued = ref.watch(authProvider);
    final userName = userLogued?.username;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
        ),
        actions: [
          userLogued != null
              ? ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20.sp),
                  child: GestureDetector(
                    child: Image.network(
                      userLogued.photoUrl!,
                      height: 25.sp,
                      width: 25.sp,
                    ),
                    onTap: () {
                      final RenderBox button =
                          context.findRenderObject() as RenderBox;
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          double.infinity,
                          35.sp,
                          10.h,
                          button.size.height,
                        ),
                        items: [
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text('Configuración'),
                              onTap: () {},
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.exit_to_app),
                              title: Text('Cerrar sesión'),
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pop(context);
                                ref.read(authProvider.notifier).clearUser();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : SizedBox(),
          TextButton(
            child: Text(
              userLogued != null
                  ? Utils().getUsernameByGoogle(userName!)
                  : 'Iniciar sesión',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (userLogued == null) {
                Navigator.pushNamed(context, AppRoutes.login);
              }
            },
          ),
          userLogued != null
              ? IconButton(
                  icon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.notifications_none_rounded),
                  ),
                  onPressed: () {},
                )
              : SizedBox(),
        ],
      ),
      body: degreeAsync.when(
        data: (degrees) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h, child: AdvertisingCarousel()),
              SizedBox(height: 2.5.h),
              Text(
                'Grados Académicos',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 5.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: degrees.length,
                  itemBuilder: (context, index) {
                    final degree = degrees[index];
                    return FadeIn(
                      delay: Duration(seconds: index * 1),
                      child: GestureDetector(
                        child: OptionCard(text: degree.name),
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.searchPageByCategory,
                          arguments: degree.id,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 1.5.h),
              Text(
                'Mis Cursos',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 17.h, width: double.infinity),
              Text(
                'Mejor Valorados',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 17.h,
                width: double.infinity,
                child: FutureBuilder(
                  future: CourseRepositoryImpl().getRankingCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    final courses = snapshot.data;
                    if (courses == null || courses.isEmpty) {
                      return Center(child: Text('No hay cursos disponibles'));
                    }
                    return ListView.builder(
                      itemCount: courses.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return FadeInRight(
                          delay: Duration(seconds: index * 1),
                          child: InkWell(
                            child: CoursesHomeCard(
                              courseRanking: course,
                              key: ValueKey(index),
                            ),
                            onTap: () {
                              _navigateToCoursePage(context, course.id);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 1.5.h),
              Text(
                'Recien Agregados',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 17.h,
                width: double.infinity,
                child: FutureBuilder(
                  future: CourseRepositoryImpl().getRecentCreated(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('No se pudo cargar la información'),
                      );
                    }
                    final courses = snapshot.data;
                    if (courses == null || courses.isEmpty) {
                      return Center(child: Text('No hay cursos disponibles'));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return FadeInRight(
                          delay: Duration(seconds: index * 1),
                          child: InkWell(
                            child: CoursesHomeCard(
                              courseEntity: course,
                              key: ValueKey(index),
                            ),
                            onTap: () {
                              _navigateToCoursePage(context, course.id!);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        error: (error, _) {
          return Center(child: const SizedBox());
        },
        loading: () => SizedBox.shrink(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.searchPage),
      ),
    );
  }

  void _navigateToCoursePage(BuildContext context, int id) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            CoursePage(courseId: id),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        settings: RouteSettings(name: AppRoutes.coursePage, arguments: id),
      ),
    );
  }
}

/* Neuton */
