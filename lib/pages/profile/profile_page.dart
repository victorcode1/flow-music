import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainController);
    final platform = Theme.of(context).platform;

    return ProfileScreen(
      actions: [
        SignedOutAction((context) {
          controller.logAuth();
        }),
      ],
      showMFATile: kIsWeb ||
          platform == TargetPlatform.iOS ||
          platform == TargetPlatform.android,
      showUnlinkConfirmationDialog: true,
      showDeleteConfirmationDialog: true,
    );
  }
}
