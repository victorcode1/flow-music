import 'dart:convert';

import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/datasource/services/data_repo/search_app_bar_data_repo.dart';
import 'package:flow_music/settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final class SearchAppbar extends SearchAppBarDataRepo {
  @override
  Future<SearchResult?> getListSearch({required String query}) async {
    if (query.isEmpty) return null;
    try {
      String url =
          'https://music.youtube.com/youtubei/v1/music/get_search_suggestions?prettyPrint=false';
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
        "input": query
      };
      Map<String, String> headers = Utils.header();
      headers['content-length'] =
          utf8.encode(json.encode(requestData)).length.toString();

      // Realizar la solicitud HTTP POST
      final res = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(requestData),
      );

      if (res.statusCode == 200) {
        // Decodificar la respuesta
        return SearchResult.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failed to load data! Status code: ${res.statusCode}');
      }
    } catch (e, s) {
      debugPrintStack(label: 'Error: $e', stackTrace: s);
      throw Exception('Failed to load data! Error: $e');
    }
  }
}
