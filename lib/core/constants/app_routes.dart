import 'package:flutter/material.dart';
import 'package:inprosur_teach_app/presentation/pages/buy/buy_page.dart';
import 'package:inprosur_teach_app/presentation/pages/config/config_page.dart';
import 'package:inprosur_teach_app/presentation/pages/courses/course_page.dart';
import 'package:inprosur_teach_app/presentation/pages/home/home_page.dart';
import 'package:inprosur_teach_app/presentation/pages/login/login_page.dart';
import 'package:inprosur_teach_app/presentation/pages/profile/profile_page.dart';
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
  static String buyPage = '/buyPage';
  static String configPage = '/configPage';
  static String profilePage = '/profilePage';

  static final Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePage(),
    login: (context) => LoginPage(),
    searchPage: (context) => SearchPage(),
    configPage: (context) => ConfigPage(),
    profilePage: (context) => ProfilePage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/searchByCategory':
        final degreeId = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (context) => SearchPageByCategory(degreeId: degreeId!),
        );

      case '/studentData':
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => StudentDataPage(userId: id),
        );

      case '/coursePage':
        final courseId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => CoursePage(courseId: courseId),
        );

      case '/buyPage':
        final courseId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BuyPage(courseId: courseId),
        );

      default:
        return null;
    }
  }
}
