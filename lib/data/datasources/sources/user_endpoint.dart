import 'package:flutter_dotenv/flutter_dotenv.dart';

String url = dotenv.env['API_URL']!;
String createUserUrl = '$url/api/users/newUser';
String getUserByEmailUrl(String email) => '$url/api/users/email/$email';
