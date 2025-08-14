import 'package:flutter_dotenv/flutter_dotenv.dart';

String searchContentUrl(String word) =>
    '${dotenv.env['API_URL']!}/api/search/content?term=$word';

String searchContentByCategoryUrl(String word, int categoryId) {
  if (word.isNotEmpty) {
    return '${dotenv.env['API_URL']!}/api/search/content/category/$categoryId?term=$word';
  }
  return '${dotenv.env['API_URL']!}/api/search/content/category/$categoryId?term="%"';
}
