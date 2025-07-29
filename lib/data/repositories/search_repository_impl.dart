import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/search_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/search_results_mapper.dart';
import 'package:inprosur_teach_app/data/models/search_results_model.dart';
import 'package:inprosur_teach_app/domain/entities/search_results_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/search_respository.dart';

class SearchRepositoryImpl implements SearchRespository {
  @override
  Future<List<SearchResultsEntity>> searchContent(String word) async {
    final dio = Dio();
    final result = await dio.get(searchContentUrl(word));
    if (result.data['success']) {
      return List<SearchResultsEntity>.from(
        result.data['data'].map(
          (json) =>
              SearchResultsMapper.toEntity(SearchResultsModel.fromMap(json)),
        ),
      );
    } else {
      throw Exception('Error searching content: ${result.data['message']}');
    }
  }

  @override
  Future<List<SearchResultsEntity>> searchContentByCategory(
    String word,
    int categoryId,
  ) async {
    final dio = Dio();
    final result = await dio.get(searchContentByCategoryUrl(word, categoryId));
    if (result.data['success']) {
      return List<SearchResultsEntity>.from(
        result.data['data'].map(
          (json) =>
              SearchResultsMapper.toEntity(SearchResultsModel.fromMap(json)),
        ),
      );
    } else {
      throw Exception(
        'Error searching content by category: ${result.data['message']}',
      );
    }
  }
}
