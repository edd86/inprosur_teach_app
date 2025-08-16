import 'package:flutter_dotenv/flutter_dotenv.dart';

final url = dotenv.env['API_URL'];
String getStudentByUserIdUrl(userId) => '$url/api/students/user?userId=$userId';
String registerStudentUrl = '$url/api/students/newStudent';
String getStudentEnrolledCoursesUrl(studentId, courseId) =>
    '$url/api/enrollments/studentEnrolledInCourse?studentId=$studentId&courseId=$courseId';

/* api/students/user?userId=12 */
