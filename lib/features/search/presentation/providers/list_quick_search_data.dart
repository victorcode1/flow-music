import 'dart:async';

import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/search/data/repositories/youtube_suggestions_repository.dart';
import 'package:flow_music/features/search/presentation/providers/search_media_intent_query.dart';
import 'package:flow_music/features/settings/presentation/controllers/default_playback_mode_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_quick_search_data.g.dart';

@riverpod
class SearchDataReq extends _$SearchDataReq {
  @override
  FutureOr<List<YouTubeSearchSuggestion>> build({
    required String? search,
  }) async {
    if (search == null || search.trim().isEmpty) {
      return const [];
    }
    final playbackMode = ref.watch(defaultPlaybackModeControllerProvider);
    return fetchYouTubeSearchSuggestions(
      buildSearchQueryWithMediaIntent(search, playbackMode),
      source: 'SearchDataReq',
    );
  }

  Future<void> reload() async {
    final currentSearch = search;
    if (currentSearch == null || currentSearch.trim().isEmpty) {
      state = const AsyncValue<List<YouTubeSearchSuggestion>>.data(
        <YouTubeSearchSuggestion>[],
      );
      return;
    }

    state = const AsyncValue.loading();
    final playbackMode = ref.read(defaultPlaybackModeControllerProvider);
    state = await AsyncValue.guard(
      () async => fetchYouTubeSearchSuggestions(
        buildSearchQueryWithMediaIntent(currentSearch, playbackMode),
        source: 'SearchDataReq.reload',
      ),
    );
  }
}
