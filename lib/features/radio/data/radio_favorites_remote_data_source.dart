import 'package:flow_music/features/auth/data/remote/authenticated_function_client.dart';
import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';

/// Acceso de bajo nivel a la copia remota de emisoras favoritas.
///
/// Estructura del documento:
///   users/{uid}/radioFavorites/{stationKey} -> RadioStation.rawData
class RadioFavoritesRemoteDataSource {
  RadioFavoritesRemoteDataSource(this._client);

  final AuthenticatedFunctionClient _client;

  Future<List<RadioStation>> readAll(String uid) async {
    final json = await _client.post('userDataRead', {
      'resource': 'radioFavorites',
    });
    return _items(json).map((item) => RadioStation.fromJson(item)).toList();
  }

  Future<void> upsert(String uid, RadioStation station) async {
    final key = RadioFavoritesRepository.keyFor(station);
    if (key.isEmpty) return;
    await _client.post('userDataUpsert', {
      'resource': 'radioFavorites',
      'id': key,
      'data': station.toJson(),
    });
  }

  Future<void> remove(String uid, String stationKey) async {
    if (stationKey.isEmpty) return;
    await _client.post('userDataDelete', {
      'resource': 'radioFavorites',
      'id': stationKey,
    });
  }

  Future<void> replaceAll(String uid, List<RadioStation> stations) async {
    await _client.post('userDataReplaceAll', {
      'resource': 'radioFavorites',
      'items': stations
          .where(
            (station) => RadioFavoritesRepository.keyFor(station).isNotEmpty,
          )
          .map((station) => station.toJson())
          .toList(),
    });
  }
}

List<Map<String, dynamic>> _items(Map<String, dynamic> json) {
  final raw = json['items'];
  if (raw is! List) return const <Map<String, dynamic>>[];
  return raw
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .toList();
}
