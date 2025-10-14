import 'dart:convert';

import 'package:flow_music/core/datasource/model/song_id.dart';
import 'package:flow_music/core/datasource/model/song_id_response.dart';
import 'package:flow_music/core/utils/apikeys.dart';
import 'package:flow_music/core/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'play_song_id.g.dart';

@Riverpod(keepAlive: true)
class PlaySongId extends _$PlaySongId {
  @override
  FutureOr<SongIdResponde?> build({required String songId}) {
    return _fetchData(songId: songId);
  }

  Future<SongIdResponde?> _fetchData({required String songId}) async {
    try {
      String url =
          'https://www.youtube.com/youtubei/v1/player?key=$YOUTUBE_ANDROID_MUSIC';
      String bodyParams = json.encode(Model(
          contentCheckOk: true,
          racyCheckOk: true,
          playbackContext: const PlaybackContext(
              contentPlaybackContext:
                  ContentPlaybackContext(signatureTimestamp: 19250)),
          videoId: songId,
          context: const Context(
              thirdParty: ThirdParty(embedUrl: "https://www.youtube.com"),
              client: Client(
                  hl: "en",
                  gl: "US",
                  androidSdkVersion: 31,
                  clientScreen: "WATCH",
                  clientName: "ANDROID_MUSIC",
                  clientVersion: "5.26.1"))));
      Map<String, String> headers = Utils.header();
      headers['content-length'] = utf8.encode(bodyParams).length.toString();
      final res =
          await http.post(Uri.parse(url), headers: headers, body: bodyParams);

      if (res.statusCode == 200) {
        debugPrint(
            SongIdResponde.fromJson(json.decode(res.body)).toJson().toString());
        return SongIdResponde.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('Stack: $s');
      throw Exception('Failed to load data!');
    }
  }
}
