import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/data/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

// Favorites are intentionally local-only. Hive is opened before runApp.
@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  final FavoritesRepository _repository = const FavoritesRepository();

  @override
  List<FavoriteSong> build() => _repository.readAll();

  bool isFavorite(String videoId) {
    if (videoId.isEmpty) return false;
    return state.any((favorite) => favorite.videoId == videoId);
  }

  Future<void> add({
    required String videoId,
    required String title,
    required String author,
    required String thumbnailUrl,
  }) async {
    if (videoId.isEmpty || isFavorite(videoId)) return;
    final favorite = FavoriteSong(
      videoId: videoId,
      title: title,
      author: author,
      thumbnailUrl: thumbnailUrl,
      addedAt: DateTime.now(),
    );
    await _repository.add(favorite);
    state = [favorite, ...state];
  }

  Future<void> remove(String videoId) async {
    if (videoId.isEmpty) return;
    await _repository.remove(videoId);
    state = state.where((favorite) => favorite.videoId != videoId).toList();
  }

  Future<bool> toggle({
    required String videoId,
    required String title,
    required String author,
    required String thumbnailUrl,
  }) async {
    if (videoId.isEmpty) return false;
    if (isFavorite(videoId)) {
      await remove(videoId);
      return false;
    }
    await add(
      videoId: videoId,
      title: title,
      author: author,
      thumbnailUrl: thumbnailUrl,
    );
    return true;
  }
}
