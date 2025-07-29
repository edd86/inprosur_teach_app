import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/data/repositories/degree_repository_impl.dart';
import 'package:inprosur_teach_app/domain/entities/degree_entity.dart';
import 'package:inprosur_teach_app/domain/repositories/degree_repository.dart';

final degreeRepositoryProvider = Provider<DegreeRepository>((ref) {
  return DegreeRepositoryImpl();
});

final degreesProvider =
    StateNotifierProvider<DegreeNotifier, AsyncValue<List<DegreeEntity>>>((
      ref,
    ) {
      return DegreeNotifier(ref);
    });

class DegreeNotifier extends StateNotifier<AsyncValue<List<DegreeEntity>>> {
  final Ref ref;

  DegreeNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadDegrees();
  }

  Future<void> loadDegrees() async {
    try {
      state = const AsyncValue.loading();
      final repo = ref.read(degreeRepositoryProvider);
      final degrees = await repo.getDegrees();
      state = AsyncValue.data(degrees);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
