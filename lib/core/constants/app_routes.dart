import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/course_page.dart';
import 'package:inprosur_teach_app/presentation/pages/home/home_page.dart';
import 'package:inprosur_teach_app/presentation/pages/login/login_page.dart';
import 'package:inprosur_teach_app/presentation/pages/search/search_page.dart';
import 'package:inprosur_teach_app/presentation/pages/search/search_page_by_category.dart';
import 'package:inprosur_teach_app/presentation/pages/student/student_data_page.dart';

class AppRoutes {
  static String homePage = '/';
  static String login = '/login';
  static String studentData = '/studentData';
  static String searchPage = '/search';
  static String searchPageByCategory = '/searchByCategory';
  static String coursePage = '/coursePage';

  static final Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePage(),
    login: (context) => LoginPage(),
    searchPage: (context) => SearchPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.searchPageByCategory) {
      final degreeId = settings.arguments as int?;
      return MaterialPageRoute(
        builder: (context) => SearchPageByCategory(degreeId: degreeId!),
      );
    }
    if (settings.name == AppRoutes.studentData) {
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (context) => StudentDataPage(userId: id),
      );
    }
    if (settings.name == AppRoutes.coursePage) {
      final courseId = settings.arguments as int;
      final instructorId = settings.arguments as int;

      return MaterialPageRoute(
        builder: (context) =>
            CoursePage(courseId: courseId, instructorId: instructorId),
      );
    }
    return null;
  }
}
