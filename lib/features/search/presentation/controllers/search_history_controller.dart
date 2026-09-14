import 'package:flow_music/features/search/data/search_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchHistoryControllerProvider =
    NotifierProvider<SearchHistoryController, List<String>>(
      SearchHistoryController.new,
    );

class SearchHistoryController extends Notifier<List<String>> {
  final SearchHistoryRepository _repository = const SearchHistoryRepository();
  Future<void> _pendingOperation = Future.value();

  @override
  List<String> build() => _repository.readAll();

  Future<void> record(String query) => _enqueue(() async {
    state = await _repository.record(query);
  });

  Future<void> remove(String query) => _enqueue(() async {
    state = await _repository.remove(query);
  });

  Future<void> clear() => _enqueue(() async {
    await _repository.clear();
    state = const [];
  });

  Future<void> _enqueue(Future<void> Function() operation) {
    final result = _pendingOperation.then((_) => operation());
    _pendingOperation = result.catchError((Object _, StackTrace _) {});
    return result;
  }
}
