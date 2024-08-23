import 'package:flow_music/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarMain extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

  @override
  ConsumerState<AppBarMain> createState() => _AppBarMainState();

  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _AppBarMainState extends ConsumerState<AppBarMain>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ref.read(mainController).animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(mainController);

    return AppBar(
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 80,
          height: 50,
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: GestureDetector(
            onTap: () {
              if (controller.animationController!.isCompleted) {
                controller.animationController!.reverse();
                controller.chageViewContet();
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
            child: AnimatedIcon(
                size: 30,
                icon: AnimatedIcons.menu_arrow,
                progress: controller.animationController ??
                    AnimationController(vsync: this),
                color: Colors.black),
          ),
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Visibility(
            visible: controller.searchController.text.isNotEmpty,
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: ElevatedButton(
                        onPressed: () => controller.deleteContentSearch(),
                        child: const Text('Clear')))),
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
                      isExtended: false,
                      heroTag: 'userBtn',
                      onPressed: () =>
                          controller.authenticante(context: context),
                      elevation: 1,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.person)))),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
