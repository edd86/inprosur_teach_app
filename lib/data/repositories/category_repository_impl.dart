import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/category_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/category_mapper.dart';
import 'package:inprosur_teach_app/data/models/category_model.dart';
import 'package:inprosur_teach_app/domain/entities/category_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    List<CategoryEntity> categories = [];
    final dio = Dio();
    final result = await dio.get(getAllCategoriesUrl);
    final categoriesJson = result.data['data'];
    for (var category in categoriesJson) {
      categories.add(CategoryMapper.toEntity(CategoryModel.fromJson(category)));
    }
    return categories;
  }

  @override
  Future<List<CategoryEntity>> getCategoriesByDegreeId(int degreeId) async {
    List<CategoryEntity> categories = [];
    final dio = Dio();
    final result = await dio.get(getCategoriesByDegreeUrl(degreeId));
    for (var category in result.data['data']) {
      categories.add(CategoryMapper.toEntity(CategoryModel.fromJson(category)));
    }
    return categories;
  }
}
