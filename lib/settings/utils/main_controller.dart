import 'package:flow_music/provider/audio_player_controller.dart';
import 'package:flow_music/settings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainController =
    ChangeNotifierProvider<MainController>((ref) => MainController(ref: ref));

class MainController extends ChangeNotifier {
  ChangeNotifierProviderRef ref;

  MainController({required this.ref}) {
    ref.read(audioPlayerProviderProvider.notifier).initState();
  }

  GlobalKey<ScaffoldMessengerState> scaffoldMessage =
      GlobalKey<ScaffoldMessengerState>();

  GoRouter get router => ref.watch(routeProvider);

  void toast(String message, {Key? textKey, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, key: textKey),
        duration: Duration(milliseconds: message.length * 25),
      ),
    );
  }

  sendMesage(String s, {required Key textKey}) {
    scaffoldMessage.currentState?.showSnackBar(
      SnackBar(
        content: Text(s, key: textKey),
        duration: Duration(milliseconds: s.length * 25),
      ),
    );
  }
}
