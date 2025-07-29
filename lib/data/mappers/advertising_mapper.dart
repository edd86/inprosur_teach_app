import 'package:inprosur_teach_app/data/models/advertising_model.dart';
import 'package:inprosur_teach_app/domain/entities/advertising_entity.dart';

class AdvertisingMapper {
  static AdvertisingEntity toEntity(AdvertisingModel model) {
    return AdvertisingEntity(
      id: model.id,
      imgUrl: model.imgUrl,
      externalUrl: model.externalUrl,
      status: model.status,
      createdAt: model.createdAt,
      courseId: model.courseId,
    );
  }

  static AdvertisingModel toModel(AdvertisingEntity entity) {
    return AdvertisingModel(
      id: entity.id,
      imgUrl: entity.imgUrl,
      externalUrl: entity.externalUrl,
      status: entity.status,
      createdAt: entity.createdAt,
      courseId: entity.courseId,
    );
  }
}
