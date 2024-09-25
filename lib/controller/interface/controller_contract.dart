import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/core/sources.dart' as sources;
import 'package:flow_music/datasource/model/list_search_result.dart'
    as list_search;
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

abstract interface class ControllerContract {
  Stream<User?> get user;
  GoRouter get router;
  String? subtitle(
      {required list_search.ListSearchSongResult data, required int index});
  String imageRes(
      {required list_search.ListSearchSongResult data, required int index});
  void escuchar(
      {required list_search.ListSearchSongResult data,
      required BuildContext context,
      required int index});
  Stream<PositionData> get positionDataStream;
  int count({required list_search.ListSearchSongResult data});
  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController;
  Future<list_search.ListSearchSongResult?> getListSong({required data});
  String urlSong({required data});
  Stream<Duration?> get stremPosiscion;
  Stream<Duration?> get stremDuracion;
  Future<void> setAudioPause();
  Future<void> setAudioStatePaused();
  Future<void> setAudioStateDetached();
  void search(
      {required BuildContext context, required SearchDelegate delegate});
  String dataRes(
      {required list_search.ListSearchSongResult data, required int index});
  Future<Map<String, String>> extra({required String data});
  Future<SongIdResponde?> getSong({required String data});
  void playRadio({required sources.UrlSource source});
  Future<void> replay();
  void init();
  Future<void> seek({required Duration duration});
  Future<void> setAudioStateStopped();
  Future<void> setSource({required sources.UrlSource source});
  Stream<PlayerState> get statusStream;
  Future<void> logAuth();
  Future<void> autoPlay({required String data});
}
