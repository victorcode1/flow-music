import 'package:easy_localization/easy_localization.dart';
import 'package:flow_music/app/app.dart';
import 'package:flow_music/pages/shared/custom_info_version/provider/info_version.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();
  await Hive.initFlutter();
  await Hive.openBox('chat');
  final packageInfo = await PackageInfo.fromPlatform();

  runApp(
    ProviderScope(
      overrides: [
        infoVersionProvider.overrideWithBuild((ref, notifier) {
          return InfoVersion().build().copyWith(
            version: packageInfo.version,
            buildNumber: int.tryParse(packageInfo.buildNumber) ?? 1,
          );
        }),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('es')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: MainApp(),
      ),
    ),
  );
}
