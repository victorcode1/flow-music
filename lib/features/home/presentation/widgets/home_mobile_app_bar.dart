import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flow_music/features/home/presentation/widgets/app_bar.dart';
import 'package:flow_music/features/radio/presentation/widgets/radio_search_delegate.dart';
import 'package:flow_music/features/search/presentation/widgets/search_song.dart';
import 'package:flutter/material.dart' hide SearchDelegate;
import 'package:flutter/widget_previews.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeMobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeMobileAppBar({
    super.key,
    this.query,
    required this.showNowPlayingDetails,
    required this.showMiniPlayer,
    this.isRadioSection = false,
    this.showBack = false,
    this.onBack,
  });

  final Function(String)? query;
  final bool showNowPlayingDetails;
  final bool showMiniPlayer;

  /// Estando en Radio o en el mapa, el buscador es de emisoras: buscar
  /// canciones de YouTube ahi no lleva a ninguna parte.
  final bool isRadioSection;

  /// Hay una lista abierta encima de las sugerencias: se muestra la flecha para
  /// volver al home.
  final bool showBack;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppAbarMain(
      query: query,
      showSearch: () => showSearch(
        context: context,
        delegate: isRadioSection ? RadioSearchDelegate() : ViewSearchDelegate(),
      ),
      showNowPlayingDetails: showNowPlayingDetails,
      showNowPlayingTitle: !showMiniPlayer,
      showBack: showBack,
      onBack: onBack,
    );
  }

  @override
  Size get preferredSize => AppAbarMain(
    query: query,
    showSearch: () async {},
    showNowPlayingDetails: showNowPlayingDetails,
    showNowPlayingTitle: !showMiniPlayer,
  ).preferredSize;
}

@Preview(name: 'Home mobile app bar')
Widget previewHomeMobileAppBar() {
  return ProviderScope(
    overrides: [
      favoritesControllerProvider.overrideWithValue(const <FavoriteSong>[]),
    ],
    child: EasyLocalization(
      supportedLocales: const [Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('es'),
      child: MaterialApp(
        home: Scaffold(
          appBar: const HomeMobileAppBar(
            showNowPlayingDetails: false,
            showMiniPlayer: false,
          ),
          body: const SizedBox.expand(),
        ),
      ),
    ),
  );
}
