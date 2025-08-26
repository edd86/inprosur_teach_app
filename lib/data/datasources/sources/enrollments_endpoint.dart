import 'package:flutter_dotenv/flutter_dotenv.dart';

String url = dotenv.env['API_URL']!;

String getStundentHasEnrollmentUrl(int id) =>
    '$url/api/enrollments/studentHasEnrollments/$id';
String getStudentHasEnrolledCoursesUrl(studentId, courseId) =>
    '$url/api/enrollments/studentEnrolledInCourse?studentId=$studentId&courseId=$courseId';
String getStudentEnrolledCoursesUrl(int studentId) =>
    '$url/api/enrollments/studentCourses/$studentId';
