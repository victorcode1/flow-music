import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/datasource/model/song_id_response.dart';
import 'package:flow_music/domain/implements/domain.dart';
import 'package:flow_music/domain/sources.dart' as sources;
import 'package:flow_music/pages/contract/contract.dart';
import 'package:flow_music/provider/play_song_id.dart';
import 'package:flow_music/settings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainController =
    ChangeNotifierProvider<MainController>((ref) => MainController(ref: ref));

class MainController extends ChangeNotifier {
  late Domain _domain;
  Contract? contractView;
  ChangeNotifierProviderRef ref;
  GlobalKey<ScaffoldMessengerState> scaffoldMessage =
      GlobalKey<ScaffoldMessengerState>();

  MainController({required this.ref}) {
    _domain = Domain();
  }

  Stream<User?> get user => _domain.user;
  @override
  dispose() {
    _domain.dispose();
    super.dispose();
  }

  AsyncValue result({required String data}) =>
      ref.watch(playSongIdProvider(songId: data)).when(
            data: (data) => AsyncValue.data(data),
            error: (error, stack) => AsyncValue.error(error, stack),
            loading: () => const AsyncValue.loading(),
          );

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

  sendMesage(String s, {required Key textKey}) {
    scaffoldMessage.currentState?.showSnackBar(
      SnackBar(
        content: Text(s, key: textKey),
        duration: Duration(milliseconds: s.length * 25),
      ),
    );
  }

  Future<void> autoPlay({required String data}) async {
    if (data.isNotEmpty) {
      await _domain.setSource(source: sources.UrlSource(data)).whenComplete(() {
        sendMesage(
          'Completed setting source.',
          textKey: const Key('toast-set-source'),
        );
      });
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
    return await _domain.pause();
  }

  Future<void> setAudioStateHidden() async {
    return await _domain.pause();
  }

  Future<void> play({required sources.UrlSource source}) async {
    return await _domain.play(source: source).whenComplete(() {
      sendMesage(
        'Playing...',
        textKey: const Key('toast-playing'),
      );
    });
  }

  Future<void> setSource({required sources.UrlSource source}) async {
    return await _domain.setSource(source: source);
  }

  playListSong({String? playListId}) {
    if (playListId != null) {
      switch (_domain.status) {
        case PlayerState.stopped:
          debugPrint('playListId stopped: $playListId');

          break;
        case PlayerState.playing:
          debugPrint('playListId playing: $playListId');
          ref.watch(playSongIdProvider(songId: playListId)).when(
                data: (data) => _domain.play(
                    source: sources.UrlSource(urlSong(data: data))),
                error: (error, stack) => AsyncValue.error(error, stack),
                loading: () => const AsyncValue.loading(),
              );
          break;
        case PlayerState.paused:
          debugPrint('playListId paused: $playListId');
          break;
        case PlayerState.completed:
          debugPrint('playListId completed: $playListId');

          break;
        case PlayerState.disposed:
          debugPrint('playListId disposed: $playListId');
          break;
      }
    }
  }

  String urlSong({required data}) {
    data as SongIdResponde;
    final urlSong = data.streamingData?.adaptiveFormats
            ?.firstWhere((element) =>
                element.mimeType == "audio/mp4; codecs=\"mp4a.40.5\"")
            .url ??
        '';
    return urlSong;
  }

  void authenticante({required BuildContext context}) {
    context.go(Rutas.auth.rootValue);
  }

  Future<void> logAuth() async {
    return await _domain.logAuth();
  }

  void initHome({required Contract contractView}) {
    this.contractView = contractView;
  }
}
