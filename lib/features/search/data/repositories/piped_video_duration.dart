import 'dart:convert';

import 'package:http/http.dart' as http;

const _pipedApiBaseUrl = 'https://api.piped.private.coffee';

Future<Duration?> fetchPipedVideoDuration(String videoId) async {
  if (videoId.isEmpty) return null;

  try {
    final uri = Uri.parse(
      '$_pipedApiBaseUrl/search',
    ).replace(queryParameters: {'q': videoId, 'filter': 'videos'});
    final response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return null;
    }

    final decoded = jsonDecode(response.body);
    final items = decoded is Map<String, dynamic> ? decoded['items'] : null;
    if (items is! List) return null;

    for (final item in items) {
      if (item is! Map) continue;
      final typedItem = Map<String, dynamic>.from(item);
      if (typedItem['type'] != 'stream') continue;
      if (extractPipedVideoId(typedItem['url']) != videoId) continue;

      return parsePipedDuration(typedItem['duration']);
    }
  } catch (_) {
    return null;
  }

  return null;
}

String extractPipedVideoId(Object? value) {
  if (value is! String || value.isEmpty) return '';
  final uri = Uri.tryParse(value);
  return uri?.queryParameters['v'] ?? '';
}

Duration? parsePipedDuration(Object? rawDuration) {
  final seconds = switch (rawDuration) {
    num value => value.toDouble(),
    String value => double.tryParse(value),
    _ => null,
  };
  if (seconds == null || !seconds.isFinite || seconds <= 0) return null;
  return Duration(milliseconds: (seconds * 1000).round());
}
