import 'dart:math';

import 'package:flow_music/features/home/data/apple_top_charts_service.dart';
import 'package:flow_music/features/home/data/location_service.dart';
import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/youtube_suggestions_repository.dart';
import 'package:flutter/foundation.dart';

/// Resultado de `HomeSuggestionsRepository.load`.
class HomeSuggestionsResult {
  const HomeSuggestionsResult({
    required this.suggestions,
    required this.countryName,
  });

  /// Lista de canciones sugeridas para mostrar.
  final List<YouTubeSearchSuggestion> suggestions;

  /// Nombre legible del pais resuelto (`Colombia`, `United States`...).
  /// `null` cuando no se pudo resolver y se usaron fallback genericos.
  final String? countryName;
}

/// Fuente de sugerencias para la pantalla inicial.
///
/// Fuente principal: el top real de canciones del pais via el feed gratuito de
/// Apple Music (`AppleTopChartsService`). Como la app reproduce desde YouTube,
/// cada top se resuelve a su `videoId` buscandolo en YouTube, conservando el
/// titulo, el artista y la portada cuadrada de Apple.
///
/// Si Apple no responde (o ninguna cancion resuelve), cae a una busqueda
/// generica por pais en YouTube para que la pantalla nunca quede vacia.
class HomeSuggestionsRepository {
  HomeSuggestionsRepository({
    LocationService? locationService,
    AppleTopChartsService? appleService,
  }) : _locationService = locationService ?? const LocationService(),
       _appleService = appleService ?? const AppleTopChartsService();

  final LocationService _locationService;
  final AppleTopChartsService _appleService;

  /// Cuantas canciones del top intentamos resolver contra YouTube y el tamano
  /// de cada lote concurrente (para no saturar a YouTube).
  static const int _maxToResolve = 16;
  static const int _resolveChunkSize = 4;

  /// Queries por pais (ISO 3166-1 alpha-2). Si el pais no esta listado, se
  /// arma una query generica con el nombre/codigo.
  static const Map<String, List<String>> _countryQueries = {
    'CO': ['Musica popular Colombia', 'Top hits Colombia'],
    'MX': ['Musica popular Mexico', 'Top hits Mexico'],
    'AR': ['Musica popular Argentina', 'Top hits Argentina'],
    'CL': ['Musica popular Chile', 'Top hits Chile'],
    'PE': ['Musica popular Peru', 'Top hits Peru'],
    'ES': ['Musica popular Espana', 'Top hits Espana'],
    'US': ['Top hits USA', 'Billboard top songs'],
    'BR': ['Musica popular Brasil', 'Top hits Brasil'],
    'GB': ['UK top hits', 'Popular music UK'],
    'FR': ['Musique populaire France', 'Top hits France'],
    'DE': ['Top hits Deutschland', 'Beliebte musik Deutschland'],
    'IT': ['Musica popolare Italia', 'Top hits Italia'],
    'JP': ['Japan top hits', 'J-pop popular'],
    'KR': ['K-pop top hits', 'Korea popular songs'],
    'CA': ['Canada top hits', 'Popular music Canada'],
  };

  /// Queries de respaldo cuando no hay ubicacion.
  static final List<String> _fallbackQueries = [
    'Top hits ${DateTime.now().year}',
    'Greatest music hits',
    'Popular songs ${DateTime.now().year}',
    'Top music playlist',
    'Musica popular ${DateTime.now().year}',
    'Best songs of all time',
    'Trending music now',
    'Hits of ${DateTime.now().year}',
    'Top charts ${DateTime.now().year}',
    'Best of ${DateTime.now().year}',
    'Most popular ${DateTime.now().year}',
    'Mix of top hits',
    'Playlist top hits ${DateTime.now().year}',
  ];

  Future<HomeSuggestionsResult> load() async {
    final country = await _locationService.resolveCountry();

    // Fuente principal: tops reales del pais (Apple Music).
    final topSongs = await _appleService.fetchTopSongs(
      countryCode: country.countryCode,
    );
    if (topSongs.isNotEmpty) {
      final resolved = await _resolveTopSongs(topSongs);
      if (resolved.isNotEmpty) {
        return HomeSuggestionsResult(
          suggestions: resolved,
          countryName: country.countryName,
        );
      }
    }

    // Respaldo: busqueda generica por pais en YouTube.
    final query = _pickQuery(country);
    final suggestions = await fetchYouTubeSearchSuggestions(
      query,
      source: 'HomeSuggestionsRepository',
    );

    return HomeSuggestionsResult(
      suggestions: suggestions,
      countryName: country.countryName,
    );
  }

  /// Resuelve los tops de Apple contra YouTube en lotes concurrentes,
  /// conservando titulo/artista/portada de Apple y descartando duplicados.
  Future<List<YouTubeSearchSuggestion>> _resolveTopSongs(
    List<AppleTopSong> songs,
  ) async {
    final pending = songs.take(_maxToResolve).toList(growable: false);
    final resolved = <YouTubeSearchSuggestion>[];
    final seen = <String>{};

    for (var i = 0; i < pending.length; i += _resolveChunkSize) {
      final chunk = pending.sublist(
        i,
        min(i + _resolveChunkSize, pending.length),
      );
      final batch = await Future.wait(chunk.map(_resolveSong));
      for (final suggestion in batch) {
        if (suggestion == null) continue;
        if (!seen.add(suggestion.videoId)) continue;
        resolved.add(suggestion);
      }
    }
    return resolved;
  }

  Future<YouTubeSearchSuggestion?> _resolveSong(AppleTopSong song) async {
    final query = song.artist.isEmpty
        ? song.name
        : '${song.artist} ${song.name}';
    try {
      final results = await fetchYouTubeSearchSuggestions(
        query,
        source: 'AppleTopChart',
      );
      if (results.isEmpty) return null;
      final match = results.first;
      if (match.videoId.isEmpty) return null;
      return YouTubeSearchSuggestion(
        videoId: match.videoId,
        displayText: song.name,
        channelTitle: song.artist,
        thumbnailUrl: song.artworkUrl.isNotEmpty
            ? song.artworkUrl
            : match.thumbnailUrl,
        duration: match.duration,
      );
    } catch (error) {
      debugPrint('Resolve top song failed for "$query": $error');
      return null;
    }
  }

  String _pickQuery(ResolvedCountry country) {
    final code = country.countryCode;
    if (code != null && _countryQueries.containsKey(code)) {
      final list = _countryQueries[code]!;
      return list[Random().nextInt(list.length)];
    }
    if (code != null && country.countryName != null) {
      return 'Top music ${country.countryName}';
    }
    return _fallbackQueries[Random().nextInt(_fallbackQueries.length)];
  }
}
