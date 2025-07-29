import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/data/repositories/advertising_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/advertising_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/advertising_repository.dart';

final advertisingRepositoryProvider = Provider<AdvertisingRepository>((ref) {
  return AdvertisingRepositoryImpl();
});

final advertisingProvider =
    StateNotifierProvider<
      AdvertisingNotifier,
      AsyncValue<List<AdvertisingEntity>>
    >((ref) {
      return AdvertisingNotifier(ref);
    });

class AdvertisingNotifier
    extends StateNotifier<AsyncValue<List<AdvertisingEntity>>> {
  final Ref ref;

  AdvertisingNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAdvertisings();
  }

  Future<void> loadAdvertisings() async {
    try {
      state = const AsyncValue.loading();
      final repo = ref.read(advertisingRepositoryProvider);
      final advertisings = await repo.getAdvertisings();
      state = AsyncValue.data(advertisings);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
