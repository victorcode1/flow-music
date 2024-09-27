import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final User? user;
  const ProfilePage({super.key, this.user});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mainController).saveUser(user: widget.user);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);
    final platform = Theme.of(context).platform;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ProfileScreen(
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
          ),
        ),
      ),
    );
  }
}
