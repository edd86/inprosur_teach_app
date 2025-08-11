import 'package:inprosur_teach_app/data/models/lesson_model.dart';
import 'package:inprosur_teach_app/domain/entities/lesson_entity.dart';

class LessonMapper {
  static LessonEntity toEntity(LessonModel model) {
    return LessonEntity(
      id: model.id,
      courseId: model.courseId,
      title: model.title,
      description: model.description,
      price: model.price,
    );
  }

  static LessonModel toModel(LessonEntity entity) {
    return LessonModel(
      id: entity.id,
      courseId: entity.courseId,
      title: entity.title,
      description: entity.description,
      price: entity.price,
    );
  }
}
