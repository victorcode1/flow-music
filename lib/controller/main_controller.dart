import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/datasource/model/list_search_result.dart'
    as list_search;
import 'package:flow_music/datasource/model/search_result.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/domain/implements/domain.dart';
import 'package:flow_music/domain/sources.dart' as sources;
import 'package:flow_music/pages/auth_page/auth/auth_page.dart';
import 'package:flow_music/pages/components/appbar/controller/App_bar_con.dart';
import 'package:flow_music/pages/contract/contract.dart';
import 'package:flow_music/pages/shared/list_search_secondary/controller/list_song_controller.dart';
import 'package:flow_music/pages/shared/seek_bar/seek_bar.dart';
import 'package:flow_music/settings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

final mainController =
    ChangeNotifierProvider<MainController>((ref) => MainController(ref: ref));

class MainController extends ChangeNotifier {
  late Domain _domain;
  late AppBarCon _appBarCon;
  late ListSongController _listSongController;
  late ChangeNotifierProviderRef ref;

  AnimationController? animationController;
  Contract? contractView;

  GlobalKey<ScaffoldMessengerState> scaffoldMessage =
      GlobalKey<ScaffoldMessengerState>();

  factory MainController({required ChangeNotifierProviderRef ref}) {
    _instance.ref = ref;
    return _instance;
  }
  static final MainController _instance = MainController._internal();

  MainController._internal()
      : _domain = Domain(),
        _appBarCon = AppBarCon(),
        _listSongController = ListSongController();

  String get actualRouter =>
      ref.watch(routeProvider).routeInformationProvider.value.uri.path;

  Stream<User?> get user => _domain.user;

  GoRouter get router => ref.watch(routeProvider);

  void toast(String message, {Key? textKey, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, key: textKey),
        duration: Duration(milliseconds: message.length * 25),
      ),
    );
  }

  void search(
      {required BuildContext context, required SearchDelegate delegate}) {
    showSearch(context: context, delegate: delegate);
  }

  Future<void> autoPlay({required String data}) async {
    if (data.isNotEmpty) {
      //await _domain.setSource(source: sources.UrlSource(data));
      await _domain.play(source: sources.UrlSource(data));
    }
  }

  Future<void> setAudioStateDetached() async {
    return await _domain.dispose();
  }

  Future<void> setAudioStateResumed() async {
    return await _domain.resume();
  }

  Future<void> setAudioStateInactive() async {
    return await _domain.pause();
  }

  Future<void> setAudioStatePaused() async {
    await _domain.resume();
  }

  Future<void> setAudioPause() async {
    await _domain.pause();
  }

  Future<void> setAudioStateHidden() async {
    return await _domain.pause();
  }

  Future<void> play({required sources.UrlSource source}) async {
    await _domain.play(source: source);
    notifyListeners();
  }

  Future<void> setSource({required sources.UrlSource source}) async {
    await _domain.setSource(source: source);
    notifyListeners();
  }

  Stream<PlayerState> get playerState => _domain.statusPlay;

  Stream<Duration?> get stremDuracion => _domain.stremDuracion;
  Stream<Duration?> get stremPosiscion => _domain.stremPosiscion;

  String urlSong({required data}) {
    data as SongIdResponde;
    final urlSong = data.streamingData?.adaptiveFormats
            ?.firstWhere((element) =>
                element.mimeType == "audio/mp4; codecs=\"mp4a.40.5\"")
            .url ??
        '';
    return urlSong;
  }

  Future<void> authenticante({required BuildContext context}) async {
    // context.go(RutasShelf.auth.rootValue);
    if (!animationController!.isCompleted) {
      contractView?.content(view: const AuthPage());
      // notifyListeners();
      animationController!.forward();
      await Future.delayed(const Duration(microseconds: 800));
    } else {
      animationController!.reverse();
      await Future.delayed(const Duration(microseconds: 800));
      contractView?.content(view: const SizedBox());
    }
    notifyListeners();
  }

  Future<void> logAuth() async {
    return await _domain.logAuth();
  }

  void initHome({required Contract contractView}) {
    this.contractView = contractView;
  }

  void searchAppBar({required String query, required BuildContext context}) {
    _appBarCon.searchAppBar(
        query: query, context: context, refresh: () => notifyListeners());
  }

  Future<SearchResult?> getListResult({required String query}) async =>
      await _domain.getListResult(query: query);

  TextEditingController get searchController => _appBarCon.searchController;

  FocusNode get focusNode => _appBarCon.focusNode;

  Future<list_search.ListSearchSongResult?> getListSong({required data}) async {
    return await _listSongController.getListSong(data: data);
  }

  @override
  dispose() async {
    debugPrint('Dispose MainController');
    await _domain.dispose();
    super.dispose();
  }

  StreamController<(StreamController<Duration>, StreamController<Duration>)>
      get streamController => _domain.streamController;
  int count({required list_search.ListSearchSongResult data}) {
    return _listSongController.count(data: data);
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration?, Duration?, Duration?, PositionData>(
          _domain.positionStream,
          _domain.bufferedPositionStream,
          _domain.durationStream, (position, bufferedPosition, duration) {
        if (duration != null && position != null && bufferedPosition != null) {
          final effectiveDuration =
              Platform.isIOS || Platform.isMacOS ? duration ~/ 2 : duration;
          final effectivePosition =
              position < effectiveDuration ? position : effectiveDuration;
          if (effectiveDuration == effectivePosition) {
            debugPrint('stop');
            //pause

            setAudioPause();
          }
        }

        return PositionData(
            position!, bufferedPosition!, duration ?? Duration.zero);
      });

  void escuchar(
      {required list_search.ListSearchSongResult data,
      required BuildContext context,
      required int index}) {
    _listSongController.escuchar(data: data, context: context, index: index);
  }

  String imageRes(
      {required list_search.ListSearchSongResult data, required int index}) {
    return _listSongController.imageRes(data: data, index: index);
  }

  String? subtitle(
      {required list_search.ListSearchSongResult data, required int index}) {
    return _listSongController.subtitle(data: data, index: index);
  }

  String dataRes(
      {required list_search.ListSearchSongResult data, required int index}) {
    return _listSongController.dataRes(data: data, index: index);
  }

  Future<Map<String, String>> extra({required String data}) {
    return _listSongController.extra(data: data);
  }

  Future<SongIdResponde?> getSong({required String data}) async {
    return await _domain.resultSong(songId: data);
  }

  void deleteContentSearch() {
    _appBarCon.searchController.clear();
    notifyListeners();
  }

  Future<void> setAudioStateStopped() async {
    await _domain.stop();
  }

  Future<void> seek({required Duration duration}) async {
    await _domain.seek(duration: duration);
  }

  changeVieo({required String videoId}) {}

  void init() {
    _domain.init();
  }

  Future<void> replay() async {
    await _domain.replay();
  }

  void playRadio({required sources.UrlSource source}) {
    _domain.playRadio(source: source);
  }

  void chageViewContet() {
    contractView?.content(view: const SizedBox());
    notifyListeners();
  }
}
