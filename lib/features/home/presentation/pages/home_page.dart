import 'package:flow_music/core/audio/now_playing_provider.dart';
import 'package:flow_music/core/utils/adaptive_layout.dart';
import 'package:flow_music/features/home/presentation/controllers/home_page_controller.dart';
import 'package:flow_music/features/home/presentation/controllers/home_view_controller.dart';
import 'package:flow_music/features/home/presentation/widgets/home_desktop_sidebar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_desktop_top_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_mobile_app_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_mobile_bottom_bar.dart';
import 'package:flow_music/features/home/presentation/widgets/home_page_content.dart';
import 'package:flow_music/features/search/presentation/widgets/search_song.dart';
import 'package:flow_music/features/song/presentation/widgets/mini_player.dart';
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
  final _pageController = const HomePageController();
  String? _lastRoutePath;
  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(homeViewProvider);
    final viewCtr = ref.read(homeViewProvider.notifier);
    final currentPath = GoRouterState.of(context).uri.path;
    final previousPath = _lastRoutePath;
    _lastRoutePath = currentPath;
    _pageController.clearSearchOnRouteChange(
      ref: ref,
      mounted: mounted,
      previousPath: previousPath,
      currentPath: currentPath,
      viewController: viewCtr,
    );

    // El mini player solo aparece cuando hay audio sonando y no estamos
    // ya viendo el reproductor completo. Cubrimos los dos modos de
    // navegacion al reproductor: por homeViewProvider (state == PlaySong)
    // o por GoRouter (ruta `/playSong`).
    //
    // Importante: `homeViewProvider` es keepAlive y conserva `PlaySong`
    // aunque el usuario salte a otra seccion por el drawer (p.ej.
    // /radio-map). En esos casos `widget.child` ya no es el SongWidget,
    // asi que el AnimatedSwitcher ignora el viewState — el chequeo de
    // viewState solo aplica cuando HomePage esta renderizando su propio
    // switch (widget.child == null).
    final nowPlayingTitle = ref.watch(nowPlayingTitleProvider).asData?.value;
    final showMiniPlayer = _pageController.shouldShowMiniPlayer(
      nowPlayingTitle: nowPlayingTitle,
      child: widget.child,
      viewState: viewState,
      currentPath: currentPath,
    );
    final showNowPlayingDetails = _pageController.shouldShowNowPlayingDetails(
      child: widget.child,
      viewState: viewState,
      currentPath: currentPath,
    );

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
              query: viewCtr.setQuery,
              showSearch: () async {
                await showSearch(
                  context: context,
                  delegate: ViewSearchDelegate(),
                );
              },
            ),
            Expanded(
              child: Row(
                children: [
                  const HomeDesktopSidebar(),
                  Expanded(
                    child: ColoredBox(
                      color: colors.surface,
                      child: HomePageContent(
                        viewState: viewState,
                        viewController: viewCtr,
                        child: widget.child,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showMiniPlayer) const MiniPlayer(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HomeMobileAppBar(
        query: viewCtr.setQuery,
        showNowPlayingDetails: showNowPlayingDetails,
        showMiniPlayer: showMiniPlayer,
      ),
      body: HomePageContent(
        viewState: viewState,
        viewController: viewCtr,
        child: widget.child,
      ),
      bottomNavigationBar: HomeMobileBottomBar(
        currentPath: currentPath,
        showNowPlayingDetails: showNowPlayingDetails,
        showMiniPlayer: showMiniPlayer,
        setQuery: viewCtr.setQuery,
      ),
    );
  }
}
