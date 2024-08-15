import 'package:flow_music/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarMain extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainController);
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Visibility(
            visible: controller.searchController.text.isNotEmpty,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 70),
                child: ElevatedButton(
                    onPressed: () => controller.deleteContentSearch(),
                    child: const Text('Clear')),
              ),
            ),
          )),
      title: Row(
        children: [
          Flexible(
              child: TextField(
                  focusNode: controller.focusNode,
                  controller: controller.searchController,
                  onChanged: (query) =>
                      controller.searchAppBar(query: query, context: context),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 34,
                          fontWeight: FontWeight.w500),
                      hintText: 'Busca Rapida',
                      border: InputBorder.none))),
          const SizedBox(width: 20),
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                      heroTag: 'userBtn',
                      onPressed: () =>
                          controller.authenticante(context: context),
                      elevation: 1,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.person)))),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
