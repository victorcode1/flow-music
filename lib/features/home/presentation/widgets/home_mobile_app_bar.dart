import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/features/auth/data/providers/auth_providers.dart';
import 'package:flow_music/features/auth/domain/entities/auth_user.dart';
import 'package:flow_music/features/auth/domain/repositories/auth_repository.dart';
import 'package:flow_music/features/favorites/data/favorite_song.dart';
import 'package:flow_music/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flow_music/features/home/presentation/widgets/app_bar.dart';
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
  });

  final Function(String)? query;
  final bool showNowPlayingDetails;
  final bool showMiniPlayer;

  @override
  Widget build(BuildContext context) {
    return AppAbarMain(
      query: query,
      showSearch: () =>
          showSearch(context: context, delegate: ViewSearchDelegate()),
      showNowPlayingDetails: showNowPlayingDetails,
      showNowPlayingTitle: !showMiniPlayer,
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
      authRepositoryProvider.overrideWithValue(const _PreviewAuthRepository()),
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

class _PreviewAuthRepository implements AuthRepository {
  const _PreviewAuthRepository();

  @override
  AuthUser? get currentUser => null;

  @override
  Stream<AuthUser?> get authStateChanges => Stream.value(null);

  @override
  Future<AuthUser?> refreshCurrentUser() async => null;

  @override
  Future<AuthUser?> registerWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async => null;

  @override
  Future<void> sendPasswordResetEmail(String email) async {}

  @override
  Future<AuthUser?> signInAnonymously() async => null;

  @override
  Future<AuthUser?> signInWithEmail({
    required String email,
    required String password,
  }) async => null;

  @override
  Future<AuthUser?> signInWithGoogle() async => null;

  @override
  Future<AuthUser?> signInWithGoogleIdToken(String googleIdToken) async => null;

  @override
  Future<void> signOut() async {}
}
