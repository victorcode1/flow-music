import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Una cancion del top de Apple Music (RSS marketing tools).
class AppleTopSong {
  const AppleTopSong({
    required this.name,
    required this.artist,
    required this.artworkUrl,
  });

  /// Titulo de la cancion.
  final String name;

  /// Artista principal.
  final String artist;

  /// Portada cuadrada (ya escalada a mayor resolucion).
  final String artworkUrl;
}

/// Cliente del feed gratuito de Apple Music ("most played" por pais).
///
/// Endpoint publico, sin API key:
/// `https://rss.applemarketingtools.com/api/v2/{pais}/music/most-played/{n}/songs.json`
/// donde `pais` es el codigo ISO 3166-1 alpha-2 en minusculas (us, es, mx...).
///
/// Devuelve los tops reales del pais. No lanza: ante cualquier fallo regresa
/// una lista vacia para que el repositorio caiga a su respaldo.
class AppleTopChartsService {
  const AppleTopChartsService();

  static const String _host = 'rss.applemarketingtools.com';

  Future<List<AppleTopSong>> fetchTopSongs({
    String? countryCode,
    int limit = 20,
  }) async {
    if (kIsWeb) {
      // Apple RSS does not expose CORS headers for browser clients.
      return const [];
    }

    final code = (countryCode == null || countryCode.trim().isEmpty)
        ? 'us'
        : countryCode.trim().toLowerCase();
    final uri = Uri.https(
      _host,
      '/api/v2/$code/music/most-played/$limit/songs.json',
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode < 200 || response.statusCode >= 300) {
        // Algunos paises no tienen tienda propia: caemos a Estados Unidos.
        if (code != 'us') {
          return await fetchTopSongs(countryCode: 'us', limit: limit);
        }
        return const [];
      }

      final decoded = jsonDecode(response.body);
      final feed = decoded is Map<String, dynamic> ? decoded['feed'] : null;
      final results = feed is Map<String, dynamic> ? feed['results'] : null;
      if (results is! List) return const [];

      final songs = <AppleTopSong>[];
      for (final item in results) {
        if (item is! Map) continue;
        final name = (item['name'] as String?)?.trim() ?? '';
        final artist = (item['artistName'] as String?)?.trim() ?? '';
        if (name.isEmpty) continue;
        final artwork = (item['artworkUrl100'] as String?) ?? '';
        songs.add(
          AppleTopSong(
            name: name,
            artist: artist,
            // El feed entrega 100x100; pedimos una version mas nitida.
            artworkUrl: artwork.replaceAll('100x100', '300x300'),
          ),
        );
      }
      return songs;
    } catch (error, stackTrace) {
      debugPrint('AppleTopChartsService.fetchTopSongs failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return const [];
    }
  }
}
