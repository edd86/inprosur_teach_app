import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/data/repositories/category_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/category_entity.dart';

final categoriesByDegreeProvider =
    FutureProvider.family<List<CategoryEntity>, int>((ref, degreeId) async {
      final repo = CategoryRepositoryImpl();
      return await repo.getCategoriesByDegreeId(degreeId);
    });
