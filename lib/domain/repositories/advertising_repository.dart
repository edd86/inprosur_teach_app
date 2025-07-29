import 'package:inprosur_teach_app/domain/entities/advertising_entity.dart';

abstract class AdvertisingRepository {
  Future<List<AdvertisingEntity>> getAdvertisings();
}
