import 'dart:convert';

import 'package:flow_music/datasource/model/query_search.dart';
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/provider/search.dart';
import 'package:flow_music/settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_result.g.dart';

@riverpod
FutureOr<SearchResult?> searchData(SearchDataRef ref) async {
  if (ref.watch(searchProvider).isEmpty) return null;
  try {
    String url =
        'https://music.youtube.com/youtubei/v1/music/get_search_suggestions?prettyPrint=false';
    String bodyParams = json.encode(QuerySearch(
        input: ref.watch(searchProvider),
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

@riverpod
class SearchDataReq extends _$SearchDataReq {
  @override
  FutureOr<SearchResult?> build() async {
    return fethData();
  }

  FutureOr<SearchResult?> fethData() async {
    if (ref.watch(searchProvider).isEmpty) return null;
    try {
      String url =
          'https://music.youtube.com/youtubei/v1/music/get_search_suggestions?prettyPrint=false';
      String bodyParams = json.encode(QuerySearch(
          input: ref.watch(searchProvider),
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
      debugPrint('Error: $e');
      debugPrint('Stack: $s');
      throw Exception('Failed to load data!');
    }
  }

  reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return fethData();
    });
  }
}
