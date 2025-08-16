import 'package:inprosur_teach_app/data/models/validating_model.dart';
import 'package:inprosur_teach_app/domain/entities/validating_enity.dart';

class ValidatingMapper {
  static ValidatingEnity toEntity(ValidatingModel model) {
    return ValidatingEnity(
      success: model.success,
      data: model.data,
      message: model.message,
    );
  }

  static ValidatingModel toModel(ValidatingEnity entity) {
    return ValidatingModel(
      success: entity.success,
      data: entity.data,
      message: entity.message,
    );
  }
}
