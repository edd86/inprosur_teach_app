import 'package:inprosur_teach_app/domain/entities/course_entity.dart';
import 'package:inprosur_teach_app/data/models/course_model.dart';

class CourseMapper {
  static CourseEntity modelToEntity(CourseModel model) {
    return CourseEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      instructorId: model.instructorId,
      categoryId: model.categoryId,
      price: model.price,
      isPublished: model.isPublished,
      duration: model.duration,
      thumbnailUrl: model.thumbnailUrl,
      creationDate: model.creationDate,
    );
  }

  static CourseModel entityToModel(CourseEntity entity) {
    return CourseModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      instructorId: entity.instructorId,
      categoryId: entity.categoryId,
      price: entity.price,
      isPublished: entity.isPublished,
      duration: entity.duration,
      thumbnailUrl: entity.thumbnailUrl,
      creationDate: entity.creationDate,
    );
  }
}
