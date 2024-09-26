import 'dart:convert';

import 'package:flow_music/datasource/model/load_play_list.dart';
import 'package:flow_music/datasource/services/data_repo/load_play_list_repo.dart';
import 'package:flow_music/settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadPlayList extends LoadPlayListRepo {
  @override
  Future<LoadPayListRessponse> loadPlayList(
      {required String songId,
      required String params,
      required String playlistId}) async {
    try {
      if (songId.isEmpty) {
        throw Exception('Failed to load data! songId is empty');
      }
      if (playlistId.isEmpty) {
        throw Exception('Failed to load data! playlistId is empty');
      }
      if (params.isEmpty) {
        throw Exception('Failed to load data! params is empty');
      }
      String url =
          'https://music.youtube.com/youtubei/v1/next?prettyPrint=false';

      Map<String, dynamic> requestData = {
        "context": {
          "client": {
            "clientName": "WEB_REMIX",
            "clientVersion": "1.20220918",
            "platform": "DESKTOP",
            "hl": "en",
            "visitorData": "CgtEUlRINDFjdm1YayjX1pSaBg%3D%3D"
          }
        },
        "videoId": songId,
        "isAudioOnly": true,
        "playlistId": playlistId,
        "tunerSettingValue": "AUTOMIX_SETTING_NORMAL",
        "params": params,
        "watchEndpointMusicSupportedConfigs": {
          "musicVideoType": "MUSIC_VIDEO_TYPE_ATV"
        }
      };

      String bodyParams = json.encode(requestData);

      Map<String, String> headers = Utils.header();
      headers['content-length'] = utf8.encode(bodyParams).length.toString();

      final res =
          await http.post(Uri.parse(url), headers: headers, body: bodyParams);

      if (res.statusCode == 200) {
        return LoadPayListRessponse.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      throw Exception('Failed to load data!');
    }
  }
}
