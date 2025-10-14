import 'package:flow_music/provider/audio_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

final mainController =
    ChangeNotifierProvider<MainController>((ref) => MainController(ref: ref));

class MainController extends ChangeNotifier {
  Ref ref;

  MainController({required this.ref}) {
    ref.read(audioPlayerProviderProvider.notifier).initState();
  }

  GlobalKey<ScaffoldMessengerState> scaffoldMessage =
      GlobalKey<ScaffoldMessengerState>();

  void toast(String message, {Key? textKey, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, key: textKey),
        duration: Duration(milliseconds: message.length * 25),
      ),
    );
  }

  void sendMesage(String s, {required Key textKey}) {
    scaffoldMessage.currentState?.showSnackBar(
      SnackBar(
        content: Text(s, key: textKey),
        duration: Duration(milliseconds: s.length * 25),
      ),
    );
  }

  void setAudioStateDetached() {
    ref.read(audioPlayerProviderProvider.notifier).dispose();
  }

  void setAudioStateResumed() {
    ref.read(audioPlayerProviderProvider.notifier).resume();
  }

  void setAudioStateInactive() {
    ref.read(audioPlayerProviderProvider.notifier).pause();
  }

  void setAudioStatePaused() {
    ref.read(audioPlayerProviderProvider.notifier).pause();
  }

  void setAudioStateHidden() {
    ref.read(audioPlayerProviderProvider.notifier).pause();
  }
}
