import 'dart:async';

import 'package:flow_music/features/history/data/playback_history_entry.dart';
import 'package:flow_music/features/history/presentation/controllers/playback_history_controller.dart';
import 'package:flow_music/features/home/data/home_suggestions_cache.dart';
import 'package:flow_music/features/home/data/home_suggestions_repository.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_suggestions_provider.g.dart';

/// Cuantas canciones del historial se pasan al repositorio como semillas.
const int _maxHistorySeeds = 8;

/// Carga la lista de sugerencias iniciales para mostrar en `home` cuando no
/// hay query ni reproduccion activa.
///
/// Al abrir la app se pinta lo ultimo que quedo guardado en disco, para no
/// dejar al usuario mirando el loading. Si esa tanda ya paso su hora
/// ([homeSuggestionsCacheTtl]) se renueva en segundo plano y la pantalla se
/// actualiza sola cuando llega la nueva.
///
/// `keepAlive: true` para que la lista no se pida cada vez que el usuario
/// vuelva al estado `Suggested` despues de buscar o reproducir.
@Riverpod(keepAlive: true)
class HomeSuggestions extends _$HomeSuggestions {
  /// Sube en cada refresco: es lo que hace que la tanda cambie (otras semillas
  /// del historial, otra ventana del top del pais).
  int _rotation = 0;

  @override
  Future<HomeSuggestionsResult> build() async {
    final cached = const HomeSuggestionsCache().read();
    if (cached == null) return _load();

    if (cached.isStale) unawaited(_reload());
    return cached.result;
  }

  /// Pide otra tanda (boton de refrescar / pull to refresh). Deja en pantalla
  /// la tanda anterior mientras llega la nueva.
  Future<void> refresh() {
    _rotation++;
    return _reload();
  }

  Future<void> _reload() async {
    try {
      final result = await _load();
      if (!ref.mounted) return;
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      if (!ref.mounted) return;
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<HomeSuggestionsResult> _load() async {
    final repository = HomeSuggestionsRepository();
    final result = await repository.load(
      rotation: _rotation,
      recentlyPlayed: _recentlyPlayed(),
    );
    await const HomeSuggestionsCache().write(result);
    return result;
  }

  /// Ultimas canciones escuchadas (sin emisoras), mas recientes primero.
  List<YouTubeSearchSuggestion> _recentlyPlayed() {
    return ref
        .read(playbackHistoryControllerProvider)
        .where((entry) => entry.kind == PlaybackHistoryKind.song)
        .take(_maxHistorySeeds)
        .map(
          (entry) => YouTubeSearchSuggestion(
            videoId: entry.id,
            displayText: entry.title,
            channelTitle: entry.subtitle,
            thumbnailUrl: entry.thumbnailUrl,
          ),
        )
        .toList(growable: false);
  }
}
