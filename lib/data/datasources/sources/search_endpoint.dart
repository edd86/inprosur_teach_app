import 'package:flutter_dotenv/flutter_dotenv.dart';

String searchContentUrl(String word) =>
    '${dotenv.env['API_URL']!}/api/search/content?term=$word';

String searchContentByCategoryUrl(String word, int categoryId) =>
    '${dotenv.env['API_URL']!}/api/search/content/category/$categoryId?term=$word';

/* https://9b2035xk-3000.brs.devtunnels.ms/api/search/content?term=des */
