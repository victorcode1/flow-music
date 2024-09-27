import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_music/pages/components/appbar/controller/app_bar_con.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagenPerlfil extends ConsumerWidget {
  const ImagenPerlfil({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(appBarController);
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
            height: 40,
            width: 40,
            child: FloatingActionButton(
                isExtended: false,
                heroTag: 'userBtn',
                onPressed: () => controller.authenticante(context: context),
                elevation: 1,
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
                child: StreamBuilder<User?>(
                    stream: controller.userSream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Icon(Icons.person, color: Colors.black);
                      } else if (snapshot.hasError) {
                        return const Icon(Icons.person, color: Colors.black);
                      } else if (snapshot.hasData) {
                        return CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(snapshot.data?.photoURL ?? ''));
                      }
                      return const Icon(Icons.person, color: Colors.black);
                    }))));
  }
}
