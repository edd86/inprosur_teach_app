import 'package:inprosur_teach_app/domain/entities/degree_entity.dart';
import 'package:inprosur_teach_app/data/models/degree_model.dart';

class DegreeMapper {
  static DegreeModel toModel(DegreeEntity entity) {
    return DegreeModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
    );
  }

  static DegreeEntity toEntity(DegreeModel model) {
    return DegreeEntity(
      id: model.id,
      name: model.name,
      description: model.description,
    );
  }
}
