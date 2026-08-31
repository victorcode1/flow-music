import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flow_music/features/history/data/playback_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final playbackHistoryControllerProvider =
    NotifierProvider<PlaybackHistoryController, List<PlaybackHistoryEntry>>(
      PlaybackHistoryController.new,
    );

class PlaybackHistoryController extends Notifier<List<PlaybackHistoryEntry>> {
  final PlaybackHistoryRepository _repository =
      const PlaybackHistoryRepository();

  @override
  List<PlaybackHistoryEntry> build() => _repository.readAll();

  Future<void> recordRadio({
    required String stationId,
    required String name,
    required String country,
    required String artworkUrl,
    Map<String, dynamic> stationData = const {},
  }) async {
    await _record(
      PlaybackHistoryEntry(
        id: stationId,
        title: name,
        subtitle: country,
        thumbnailUrl: artworkUrl,
        playedAt: DateTime.now(),
        playCount: 1,
        kind: PlaybackHistoryKind.radio,
        stationData: Map<String, dynamic>.unmodifiable(stationData),
      ),
    );
  }

  Future<void> clear() async {
    await _repository.clear();
    state = const [];
  }

  Future<void> _record(PlaybackHistoryEntry entry) async {
    await _repository.record(entry);
    state = _repository.readAll();
  }
}
