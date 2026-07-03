import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';

const _audioSearchIntent = 'cancion';
const _videoSearchIntent = 'video';

final _trailingMediaIntentPattern = RegExp(
  r'\s+(canci[oó]n|video)$',
  caseSensitive: false,
);

String buildSearchQueryWithMediaIntent(String query, PlaybackMode mode) {
  final trimmed = query.trim();
  if (trimmed.isEmpty) return '';

  final intent = switch (mode) {
    PlaybackMode.audio => _audioSearchIntent,
    PlaybackMode.video => _videoSearchIntent,
  };

  if (_trailingMediaIntentPattern.hasMatch(trimmed)) {
    return trimmed.replaceFirst(_trailingMediaIntentPattern, ' $intent');
  }

  return '$trimmed $intent';
}
