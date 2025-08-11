import 'package:flutter_dotenv/flutter_dotenv.dart';

String url = dotenv.env['API_URL']!;
String getAvialableLessonsInCourseUrl(int courseId) =>
    '$url/api/lessons/avialableInCourse/$courseId';
