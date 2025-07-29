import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/presentation/providers/advertising_provider.dart';
import 'package:inprosur_teach_app/presentation/providers/degree_provider.dart';

final loadingProvider = Provider<bool>((ref) {
  final advertisingState = ref.watch(advertisingProvider);
  final degreesState = ref.watch(degreesProvider);

  final isAdvertisingLoading = advertisingState.maybeWhen(
    loading: () => true,
    orElse: () => false,
  );

  final isDegreesLoading = degreesState.maybeWhen(
    loading: () => true,
    orElse: () => false,
  );

  return isAdvertisingLoading || isDegreesLoading;
});
