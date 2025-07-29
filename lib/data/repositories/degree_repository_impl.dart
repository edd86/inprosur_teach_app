import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/datasources/sources/degree_endpoint.dart';
import 'package:inprosur_teach_app/data/mappers/degree_mapper.dart';
import 'package:inprosur_teach_app/data/models/degree_model.dart';
import 'package:inprosur_teach_app/domain/entities/degree_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/degree_repository.dart';

class DegreeRepositoryImpl implements DegreeRepository {
  @override
  Future<List<DegreeEntity>> getDegrees() async {
    final dio = Dio();
    final res = await dio.get(getAllDegressUrl);
    return List<DegreeEntity>.from(
      res.data.map((json) => DegreeMapper.toEntity(DegreeModel.fromMap(json))),
    );
  }
}
