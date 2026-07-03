import 'dart:convert';

import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/piped_video_duration.dart';
import 'package:flow_music/features/search/data/repositories/youtube_search_page_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const _maxSuggestions = 12;
const _minSongDuration = Duration(minutes: 1);
const _maxSongDuration = Duration(minutes: 12);
const _youtubeSearchHost = 'www.youtube.com';
const _youtubeSearchPath = '/results';
const _pipedApiBaseUrl = 'https://api.piped.private.coffee';
const _userAgent =
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36';

const _searchPageParser = YouTubeSearchPageParser();

Future<List<YouTubeSearchSuggestion>> fetchYouTubeSearchSuggestions(
  String query, {
  String source = 'YouTubeSearch',
}) async {
  final trimmedQuery = query.trim();
  if (trimmedQuery.isEmpty) return const [];
  if (kIsWeb) {
    return _fetchPipedSearchSuggestions(trimmedQuery);
  }

  try {
    final uri = Uri.https(_youtubeSearchHost, _youtubeSearchPath, {
      'search_query': trimmedQuery,
    });
    final response = await http.get(
      uri,
      headers: const {
        'accept-language': 'en-US,en;q=0.9',
        'user-agent': _userAgent,
      },
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
        'Unexpected status code: ${response.statusCode}',
        uri,
      );
    }

    return _searchPageParser.parseSuggestions(
      response.body,
      limit: _maxSuggestions,
    );
  } catch (error, stackTrace) {
    debugPrint('YouTube search failed ($source): $error');
    debugPrintStack(stackTrace: stackTrace);
    throw Exception('Failed to search YouTube videos.');
  }
}

Future<List<YouTubeSearchSuggestion>> _fetchPipedSearchSuggestions(
  String query,
) async {
  final uri = pipedSearchUriForQuery(query);
  final response = await http.get(uri);

  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw http.ClientException(
      'Unexpected Piped status code: ${response.statusCode}',
      uri,
    );
  }

  final decoded = jsonDecode(response.body);
  final items = decoded is Map<String, dynamic> ? decoded['items'] : null;
  if (items is! List) return const [];

  final suggestions = <YouTubeSearchSuggestion>[];
  final seenVideoIds = <String>{};
  for (final item in items) {
    if (item is! Map) continue;
    final typedItem = Map<String, dynamic>.from(item);
    if (typedItem['type'] != 'stream') continue;

    final videoId = extractPipedVideoId(typedItem['url']);
    final title = typedItem['title'] as String? ?? '';
    if (videoId.isEmpty || title.isEmpty || !seenVideoIds.add(videoId)) {
      continue;
    }

    final duration = parsePipedDuration(typedItem['duration']);
    if (duration != null &&
        (duration < _minSongDuration || duration > _maxSongDuration)) {
      continue;
    }

    suggestions.add(
      YouTubeSearchSuggestion(
        videoId: videoId,
        displayText: title,
        channelTitle: typedItem['uploaderName'] as String? ?? '',
        thumbnailUrl: _youtubeThumbnailUrl(videoId),
        duration: duration,
      ),
    );
    if (suggestions.length >= _maxSuggestions) break;
  }

  return List.unmodifiable(suggestions);
}

@visibleForTesting
Uri pipedSearchUriForQuery(String query) {
  return Uri.parse(
    '$_pipedApiBaseUrl/search',
  ).replace(queryParameters: {'q': query, 'filter': 'all'});
}

String _youtubeThumbnailUrl(String videoId) {
  return 'https://i.ytimg.com/vi/$videoId/hqdefault.jpg';
}
