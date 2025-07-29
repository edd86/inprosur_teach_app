import 'package:dio/dio.dart';
import 'package:inprosur_teach_app/data/mappers/advertising_mapper.dart';
import 'package:inprosur_teach_app/data/models/advertising_model.dart';
import 'package:inprosur_teach_app/domain/entities/advertising_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/advertising_repository.dart';
import 'package:inprosur_teach_app/data/datasources/sources/advertising_endpoint.dart';

class AdvertisingRepositoryImpl implements AdvertisingRepository {
  @override
  Future<List<AdvertisingEntity>> getAdvertisings() async {
    final dio = Dio();
    final res = await dio.get(getAllAdvertisings);
    final list = res.data['data'] as List;
    return list
        .map(
          (json) => AdvertisingMapper.toEntity(AdvertisingModel.fromMap(json)),
        )
        .toList();
  }
}
