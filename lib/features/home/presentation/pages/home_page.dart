import 'package:flow_music/core/audio/radio_mini_player.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/home/presentation/widgets/home_desktop_sidebar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_desktop_top_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_mobile_app_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_mobile_bottom_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_page_content.dart';
import 'package:flutter/material.dart' hide SearchDelegate;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  final Widget? child;

  const HomePage({super.key, this.child});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    if (supportsFlowDesktopShell && useFlowWideLayout(context)) {
      final colors = Theme.of(context).colorScheme;
      // Estructura del mockup StreamBeat: barra superior a todo lo ancho, y
      // debajo la fila [sidebar | contenido]. El contenido pinta una
      // superficie opaca para que el fondo ambiente (con tinte de acento) no
      // se filtre en la zona central — el escritorio queda plano y oscuro como
      // el diseno.
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            HomeDesktopTopBar(
              query: (_) {},
              showSearch: () async => context.go('/radio'),
            ),
            Expanded(
              child: Row(
                children: [
                  const HomeDesktopSidebar(),
                  Expanded(
                    child: ColoredBox(
                      color: colors.surface,
                      child: HomePageContent(child: widget.child),
                    ),
                  ),
                ],
              ),
            ),
            const RadioMiniPlayer(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HomeMobileAppBar(onSearch: () => context.go('/radio')),
      body: HomePageContent(child: widget.child),
      bottomNavigationBar: HomeMobileBottomBar(currentPath: currentPath),
    );
  }
}
