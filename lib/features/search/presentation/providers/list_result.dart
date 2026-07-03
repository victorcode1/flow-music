import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/youtube_suggestions_repository.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/features/search/presentation/providers/search_media_intent_query.dart';
import 'package:flow_music/features/settings/presentation/controllers/default_playback_mode_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_result.g.dart';

@riverpod
Future<List<YouTubeSearchSuggestion>> searchData(Ref ref) async {
  final query = ref.watch(searchProvider).text.trim();
  final playbackMode = ref.watch(defaultPlaybackModeControllerProvider);
  if (query.isEmpty) {
    return const [];
  }

  return fetchYouTubeSearchSuggestions(
    buildSearchQueryWithMediaIntent(query, playbackMode),
    source: 'searchData',
  );
}
