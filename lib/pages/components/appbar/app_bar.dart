import 'package:flow_music/pages/components/appbar/controller/app_bar_con.dart';
import 'package:flow_music/pages/shared/imagen_perfil/imagen_perfil.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarMain extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

  @override
  ConsumerState<AppBarMain> createState() => _AppBarMainState();

  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);
}

class _AppBarMainState extends ConsumerState<AppBarMain>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ref.read(appBarController).initAppBar(tickerProvider: this);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(appBarController);
    return AppBar(
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 80,
          height: 50,
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: GestureDetector(
            onTap: () => controller.openDrawer(context: context),
            child: AnimatedIcon(
                size: 30,
                icon: AnimatedIcons.menu_arrow,
                progress: controller.animationController,
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
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                      hintText: 'Busca Rapida',
                      border: InputBorder.none))),
          const SizedBox(width: 20),
          const ImagenPerlfil(),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
