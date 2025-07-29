import 'package:flutter_dotenv/flutter_dotenv.dart';

String url = dotenv.env['API_URL']!;
String getAllCategoriesUrl = '$url/api/categories';
String getCategoriesByDegreeUrl(int degreeId) =>
    '$url/api/categories/degree?degreeId=$degreeId';

/* https://9b2035xk-3000.brs.devtunnels.ms/api/categories/degree?degreeId=1 */
