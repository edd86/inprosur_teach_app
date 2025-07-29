import 'package:inprosur_teach_app/domain/entities/degree_entity.dart';

abstract class DegreeRepository {
  Future<List<DegreeEntity>> getDegrees();
}
