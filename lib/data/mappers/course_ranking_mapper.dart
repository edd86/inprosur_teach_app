import 'package:inprosur_teach_app/domain/entities/course_ranking_entity.dart';
import 'package:inprosur_teach_app/data/models/course_ranking_model.dart';


class CourseRankingMapper {
  static CourseRankingEntity modelToEntity(CourseRankingModel model) {
    return CourseRankingEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      instructorId: model.instructorId,
      thumbnailUrl: model.thumbnailUrl,
      averageRating: model.averageRating,
      ratingCount: model.ratingCount,
    );
  }

  static CourseRankingModel entityToModel(CourseRankingEntity entity) {
    return CourseRankingModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      instructorId: entity.instructorId,
      thumbnailUrl: entity.thumbnailUrl,
      averageRating: entity.averageRating,
      ratingCount: entity.ratingCount,
    );
  }
}
