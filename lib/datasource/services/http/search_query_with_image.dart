import 'dart:convert';

import 'package:flow_music/datasource/model/list_search_result.dart';
import 'package:flow_music/datasource/services/data_repo/search_query_with_image_repo.dart';
import 'package:flow_music/settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchQueryWihtImage extends SearchQueryWithImageRepo {
  @override
  Future<ListSearchSongResult?> searchResultData(String search) async {
    try {
      if (search.isEmpty) {
        throw Exception('Failed to load data! songId is empty');
      }
      String url =
          'https://music.youtube.com/youtubei/v1/search?prettyPrint=false';
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
        "query": search,
        "params": "EgWKAQIIAWoKEAkQBRAKEAMQBA%3D%3D"
      };

      Map<String, String> headers = Utils.header();
      headers['content-length'] =
          utf8.encode(json.encode(requestData)).length.toString();

      final res = await http.post(Uri.parse(url),
          headers: headers, body: json.encode(requestData));

      if (res.statusCode == 200) {
        return ListSearchSongResult.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failed to load data! ${res.statusCode}');
      }
    } catch (e, s) {
      debugPrintStack(label: 'Error: $e', stackTrace: s);
      throw Exception('Failed to load data!');
    }
  }
}
