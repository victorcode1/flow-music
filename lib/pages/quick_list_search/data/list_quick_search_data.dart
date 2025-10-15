import 'dart:async';
import 'dart:convert';

import 'package:flow_music/core/datasource/model/query_search.dart';
import 'package:flow_music/core/datasource/model/search_result.dart';
import 'package:flow_music/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_quick_search_data.g.dart';

@riverpod
class SearchDataReq extends _$SearchDataReq {
  @override
  FutureOr<SearchResult?> build({required String? search}) async {
    if (search == null || search.isEmpty) return null;
    return fethData(search: search);
  }

  FutureOr<SearchResult?> fethData({required String? search}) async {
    try {
      String url =
          'https://music.youtube.com/youtubei/v1/music/get_search_suggestions?prettyPrint=false';
      String bodyParams = json.encode(QuerySearch(
          input: search,
          context: ContextModel(
              client: Client(
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
      debugPrintStack(
        label: 'Error SearchDataReq',
        stackTrace: s,
      );
      throw Exception('Failed to load data!');
    }
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return fethData(search: search);
    });
  }
}
