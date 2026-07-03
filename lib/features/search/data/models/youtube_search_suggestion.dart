import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YouTubeSearchSuggestion {
  const YouTubeSearchSuggestion({
    required this.videoId,
    required this.displayText,
    required this.channelTitle,
    required this.thumbnailUrl,
    this.duration,
  });

  factory YouTubeSearchSuggestion.fromJson(Map<String, dynamic> json) {
    final id = (json['id'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    final snippet =
        (json['snippet'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    final contentDetails =
        (json['contentDetails'] as Map<String, dynamic>?) ??
        <String, dynamic>{};
    final thumbnails =
        (snippet['thumbnails'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    final thumbnailUrl = _resolveThumbnailUrl(thumbnails);

    return YouTubeSearchSuggestion(
      videoId: id['videoId'] as String? ?? '',
      displayText: snippet['title'] as String? ?? '',
      channelTitle: snippet['channelTitle'] as String? ?? '',
      thumbnailUrl: thumbnailUrl,
      duration: _parseIso8601Duration(contentDetails['duration']),
    );
  }

  factory YouTubeSearchSuggestion.fromVideo(Video video) {
    return YouTubeSearchSuggestion(
      videoId: video.id.value,
      displayText: video.title,
      channelTitle: video.author,
      thumbnailUrl: video.thumbnails.highResUrl,
      duration: video.duration,
    );
  }

  final String videoId;
  final String displayText;
  final String channelTitle;
  final String thumbnailUrl;
  final Duration? duration;

  String get query => displayText;

  static String _resolveThumbnailUrl(Map<String, dynamic> thumbnails) {
    const orderedKeys = ['maxres', 'high', 'medium', 'default'];
    for (final key in orderedKeys) {
      final entry = thumbnails[key];
      if (entry is Map<String, dynamic>) {
        final url = entry['url'] as String?;
        if (url != null && url.isNotEmpty) {
          return url;
        }
      }
    }
    return '';
  }

  static Duration? _parseIso8601Duration(Object? value) {
    if (value is! String || value.isEmpty) return null;
    final match = RegExp(
      r'^P(?:(\d+)D)?T?(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?$',
    ).firstMatch(value);
    if (match == null) return null;

    final days = int.tryParse(match.group(1) ?? '') ?? 0;
    final hours = int.tryParse(match.group(2) ?? '') ?? 0;
    final minutes = int.tryParse(match.group(3) ?? '') ?? 0;
    final seconds = int.tryParse(match.group(4) ?? '') ?? 0;
    final duration = Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
    return duration > Duration.zero ? duration : null;
  }
}
