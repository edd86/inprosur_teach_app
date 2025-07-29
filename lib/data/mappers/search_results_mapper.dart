import 'package:inprosur_teach_app/data/models/search_results_model.dart';
import 'package:inprosur_teach_app/domain/entities/search_results_entity.dart';

class SearchResultsMapper {
  static SearchResultsModel toModel(SearchResultsEntity entity) {
    return SearchResultsModel(
      type: entity.type,
      id: entity.id,
      title: entity.title,
      description: entity.description,
      thumbnailUrl: entity.thumbnailUrl,
      url: entity.url,
      fileUrl: entity.fileUrl,
    );
  }

  static SearchResultsEntity toEntity(SearchResultsModel model) {
    return SearchResultsEntity(
      type: model.type,
      id: model.id,
      title: model.title,
      description: model.description,
      thumbnailUrl: model.thumbnailUrl,
      url: model.url,
      fileUrl: model.fileUrl,
    );
  }
}
