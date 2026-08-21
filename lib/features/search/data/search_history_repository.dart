import 'package:hive_ce_flutter/hive_flutter.dart';

const String searchHistoryBoxName = 'search_history';
const String _recentQueriesKey = 'recent_queries';
const int defaultSearchHistoryLimit = 12;

/// Historial de busquedas local al dispositivo.
///
/// Se guarda como una lista pequena, con la consulta mas reciente primero. No
/// contiene resultados, IDs de canciones ni datos de la cuenta.
class SearchHistoryRepository {
  const SearchHistoryRepository();

  Box get _box => Hive.box(searchHistoryBoxName);

  List<String> readAll({int limit = defaultSearchHistoryLimit}) {
    final raw = _box.get(_recentQueriesKey);
    if (raw is! List) return const [];

    final queries = <String>[];
    final normalizedSeen = <String>{};
    for (final value in raw) {
      if (value is! String) continue;
      final query = normalizeSearchQuery(value);
      if (query.isEmpty || !normalizedSeen.add(query.toLowerCase())) continue;
      queries.add(query);
      if (queries.length >= limit) break;
    }
    return List.unmodifiable(queries);
  }

  Future<List<String>> record(
    String rawQuery, {
    int limit = defaultSearchHistoryLimit,
  }) async {
    final query = normalizeSearchQuery(rawQuery);
    if (query.isEmpty) return readAll(limit: limit);

    final normalized = query.toLowerCase();
    final next = [
      query,
      ...readAll(
        limit: limit,
      ).where((existing) => existing.toLowerCase() != normalized),
    ].take(limit).toList(growable: false);
    await _box.put(_recentQueriesKey, next);
    return List.unmodifiable(next);
  }

  Future<List<String>> remove(String rawQuery) async {
    final normalized = normalizeSearchQuery(rawQuery).toLowerCase();
    if (normalized.isEmpty) return readAll();

    final next = readAll()
        .where((query) => query.toLowerCase() != normalized)
        .toList(growable: false);
    await _box.put(_recentQueriesKey, next);
    return List.unmodifiable(next);
  }

  Future<void> clear() => _box.delete(_recentQueriesKey);
}

String normalizeSearchQuery(String value) {
  return value.trim().replaceAll(RegExp(r'\s+'), ' ');
}
