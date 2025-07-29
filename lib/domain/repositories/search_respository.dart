import 'package:inprosur_teach_app/domain/entities/search_results_entity.dart';

abstract class SearchRespository {
  Future<List<SearchResultsEntity>> searchContent(String word);
  Future<List<SearchResultsEntity>> searchContentByCategory(
    String word,
    int categoryId,
  );
}
