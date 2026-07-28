import 'package:flow_music/features/radio/data/models/radio_station.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final radioFavoritesControllerProvider =
    NotifierProvider<RadioFavoritesController, List<RadioStation>>(
      RadioFavoritesController.new,
    );

class RadioFavoritesController extends Notifier<List<RadioStation>> {
  final RadioFavoritesRepository _repository = const RadioFavoritesRepository();

  @override
  List<RadioStation> build() => _repository.readAll();

  bool contains(RadioStation station) => _repository.contains(station);

  Future<bool> toggle(RadioStation station) async {
    final added = await _repository.toggle(station);
    state = _repository.readAll();
    return added;
  }

  Future<void> remove(String stationId) async {
    await _repository.remove(stationId);
    state = _repository.readAll();
  }
}
