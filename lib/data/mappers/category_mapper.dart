import 'package:inprosur_teach_app/data/models/category_model.dart';
import 'package:inprosur_teach_app/domain/entities/category_entity.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      degreeId: model.degreeId,
    );
  }

  static CategoryModel toModel(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      degreeId: entity.degreeId,
    );
  }
}
