import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/app/app.dart';
import 'package:flow_music/core/audio/background_audio_handler.dart';
import 'package:flow_music/features/radio/data/radio_favorites_repository.dart';
import 'package:flow_music/features/radio/data/radio_playlists_repository.dart';
import 'package:flow_music/features/settings/presentation/controllers/theme_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();
  await Hive.initFlutter();
  await Hive.openBox(settingsBoxName);
  await Hive.openBox(radioFavoritesBoxName);
  await Hive.openBox(radioPlaylistsBoxName);
  await initFlowAudioHandler();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('es')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MainApp(),
      ),
    ),
  );
}
