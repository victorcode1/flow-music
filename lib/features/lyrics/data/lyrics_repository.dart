import 'dart:convert';

import 'package:http/http.dart' as http;

class LyricsRepository {
  const LyricsRepository();

  Future<String?> findLyrics({
    required String title,
    required String artist,
  }) async {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty) return null;

    final uri = Uri.https('lrclib.net', '/api/search', {
      'track_name': cleanTitle,
      if (artist.trim().isNotEmpty) 'artist_name': artist.trim(),
    });
    final response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return null;
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List || decoded.isEmpty) return null;

    for (final item in decoded.whereType<Map>()) {
      final plainLyrics = item['plainLyrics'] as String?;
      final syncedLyrics = item['syncedLyrics'] as String?;
      final lyrics = plainLyrics?.trim().isNotEmpty == true
          ? plainLyrics
          : syncedLyrics;
      if (lyrics != null && lyrics.trim().isNotEmpty) {
        return lyrics.trim();
      }
    }
    return null;
  }
}
