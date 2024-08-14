import 'dart:convert';

import 'package:flow_music/datasource/model/list_search_result.dart';
import 'package:flow_music/datasource/model/query_search.dart';
import 'package:flow_music/datasource/model/search_model_request.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchQuery {
  Future<SearchResult?> getListSearch({required String query}) async {
    if (query.isEmpty) return null;
    try {
      String url =
          'https://music.youtube.com/youtubei/v1/music/get_search_suggestions?prettyPrint=false';
      String bodyParams = json.encode(QuerySearch(
          input: query,
          context: ContextModel(
              client: ClientModel(
                  clientName: "WEB_REMIX",
                  clientVersion: "1.20220918",
                  platform: "DESKTOP",
                  hl: "en",
                  visitorData: "CgtEUlRINDFjdm1YayjX1pSaBg%3D%3D"))));
      Map<String, String> headers = Utils.header();
      headers['content-length'] = utf8.encode(bodyParams).length.toString();

      final res =
          await http.post(Uri.parse(url), headers: headers, body: bodyParams);

      if (res.statusCode == 200) {
        debugPrint('Data: ${SearchResult.fromJson(json.decode(res.body))}');
        return SearchResult.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failed to load data!');
      }
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('Stack: $s');
      throw Exception('Failed to load data!');
    }
  }

  Future<ListSearchSongResult?> searchResultData(String search) async {
    if (search.isEmpty) return null;
    try {
      String url =
          'https://music.youtube.com/youtubei/v1/search?prettyPrint=false';
      String bodyParams = json.encode(SearModelRequest(
          params: "EgWKAQIIAWoKEAkQBRAKEAMQBA%3D%3D",
          query: search,
          context: const Context(
              client: ClientSearch(
                  clientName: "WEB_REMIX",
                  clientVersion: "1.20220918",
                  platform: "DESKTOP",
                  hl: "en",
                  visitorData: "CgtEUlRINDFjdm1YayjX1pSaBg%3D%3D"))));
      Map<String, String> headers = Utils.header();
      headers['content-length'] = utf8.encode(bodyParams).length.toString();
      final res =
          await http.post(Uri.parse(url), headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        debugPrint(ListSearchSongResult.fromJson(json.decode(res.body))
            .toJson()
            .toString());
        return ListSearchSongResult.fromJson(json.decode(res.body));
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
