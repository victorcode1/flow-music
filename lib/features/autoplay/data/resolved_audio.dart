import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';

/// Audio stream resolved ahead of time for a search suggestion, so the player
/// can start the track without re-hitting Piped / youtube_explode_dart.
class ResolvedAudio {
  const ResolvedAudio({
    required this.suggestion,
    required this.audioUrl,
    this.cacheFilePath,
    this.mimeType,
    this.requestHeaders = const {},
    this.rangeEnd,
    this.fileExtension,
    this.title,
    this.author,
    this.thumbnailUrl,
    this.duration,
  });

  final YouTubeSearchSuggestion suggestion;
  final String audioUrl;

  /// Local path to a cached copy of the audio bytes, if the prefetcher was
  /// able to download it. When present, prefer this over [audioUrl].
  final String? cacheFilePath;
  final String? mimeType;
  final Map<String, String> requestHeaders;
  final int? rangeEnd;
  final String? fileExtension;
  final String? title;
  final String? author;
  final String? thumbnailUrl;
  final Duration? duration;

  String get videoId => suggestion.videoId;

  /// True when the network audio URL is past (or about to pass) its
  /// `expire=` timestamp. googlevideo.com URLs are signed and stop working
  /// after that point; trying to play one hangs `AVPlayerItem.setSource`
  /// for ~30s before failing, freezing the UI. Treat anything within a
  /// 60s margin as already expired so we re-resolve a fresh URL.
  ///
  /// Returns `false` for URLs without an `expire` param (e.g. a local file,
  /// or proxies that don't expose it) — those are handled by the network
  /// timeout in the caller.
  bool get isUrlExpired {
    final cachePath = cacheFilePath;
    if (cachePath != null && cachePath.isNotEmpty) return false;
    final expireRaw = Uri.tryParse(audioUrl)?.queryParameters['expire'];
    if (expireRaw == null || expireRaw.isEmpty) return false;
    final expireUnix = int.tryParse(expireRaw);
    if (expireUnix == null) return false;
    final nowUnix = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    return expireUnix - nowUnix <= 60;
  }

  ResolvedAudio copyWith({String? cacheFilePath}) {
    return ResolvedAudio(
      suggestion: suggestion,
      audioUrl: audioUrl,
      cacheFilePath: cacheFilePath ?? this.cacheFilePath,
      mimeType: mimeType,
      requestHeaders: requestHeaders,
      rangeEnd: rangeEnd,
      fileExtension: fileExtension,
      title: title,
      author: author,
      thumbnailUrl: thumbnailUrl,
      duration: duration,
    );
  }
}
