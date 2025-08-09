import 'package:flutter_dotenv/flutter_dotenv.dart';

String url = dotenv.env['API_URL']!;
String getRankingCoursesUrl = '$url/api/course-ratings/courseRanking';
String getRecentCreatedUrl = '$url/api/courses/recents';
String getCourseByIdUrl(int id) => '$url/api/courses/$id';
String getCourseRatingUrl(int id) => '$url/api/course-ratings/$id';
String getCourseDetailsUrl(int id) => '$url/api/courses/courseInstructor/$id';
