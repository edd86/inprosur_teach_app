import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inprosur_teach_app/domain/entities/search_results_entity.dart';
import 'package:inprosur_teach_app/data/repositories/search_repository_impl.dart';

class SearchNotifier
    extends StateNotifier<AsyncValue<List<SearchResultsEntity>>> {
  SearchNotifier() : super(const AsyncValue.data([]));

  final _repo = SearchRepositoryImpl();

  Future<void> search(String word) async {
    if (word.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }
    state = const AsyncValue.loading();
    try {
      final results = await _repo.searchContent(word);
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final searchProvider =
    StateNotifierProvider<
      SearchNotifier,
      AsyncValue<List<SearchResultsEntity>>
    >((ref) => SearchNotifier());
