import 'dart:async';

import 'package:flow_music/features/search/data/models/youtube_search_suggestion.dart';
import 'package:flow_music/features/song/presentation/controllers/song_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_controller.g.dart';

sealed class ViewState {
  const ViewState();

  factory ViewState.quickListSong({String? data}) = SuggestedListSearchListSong;
  factory ViewState.listSong({String? query}) = ListSong;
  factory ViewState.suggested() = Suggested;
  factory ViewState.playSong({Map<String, String>? queryParameters}) = PlaySong;
}

class PlaySong extends ViewState {
  final Map<String, String>? queryParameters;
  const PlaySong({this.queryParameters});
}

class ListSong extends ViewState {
  final String? query;
  const ListSong({this.query});
}

class SuggestedListSearchListSong extends ViewState {
  final String? data;
  const SuggestedListSearchListSong({this.data});
}

class Suggested extends ViewState {
  const Suggested({String? data});
}

@Riverpod(keepAlive: true)
class HomeView extends _$HomeView {
  Timer? _debounce;
  ViewState? _previousState;

  @override
  ViewState build() {
    return ViewState.suggested();
  }

  void setQuery(String p1) {
    if (p1.isEmpty) {
      state = ViewState.suggested();
    } else {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 600), () {
        if (p1.isNotEmpty) {
          // state = ViewState.quickListSong(data: p1);
          // state = ViewState.quickListSong(data: p1);
          state = ViewState.listSong(query: p1);
        }
      });
    }
  }

  void showListSearch(String p1) {
    if (p1.isNotEmpty) {
      state = ViewState.listSong(query: p1);
    }
  }

  void listen(YouTubeSearchSuggestion suggestion) {
    final videoId = suggestion.videoId;
    if (videoId.isEmpty) return;
    _previousState = state is PlaySong ? _previousState : state;
    final duration = suggestion.duration;
    ref
        .read(songController)
        .preloadMetadata(
          videoId: videoId,
          title: suggestion.displayText,
          author: suggestion.channelTitle,
          thumbnailUrl: suggestion.thumbnailUrl,
        );
    state = ViewState.playSong(
      queryParameters: {
        'idSong': videoId,
        'playListId': '',
        if (duration != null) 'durationMs': '${duration.inMilliseconds}',
      },
    );
  }

  void back() {
    final previous = _previousState ?? ViewState.suggested();
    _previousState = null;
    state = previous;
  }
}
