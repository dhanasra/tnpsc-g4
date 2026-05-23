import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';
import 'app/localization/app_localization.dart';
import 'core/ads/ad_manager.dart';
import 'core/ads/widgets/app_open_ad_service.dart';
import 'core/storage/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await HiveService.init();
  await AdManager.instance.initialize();

  AppOpenAdService.load();
  AppOpenAdService.show();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      path: 'assets/translations',

      child: const App(),
    ),
  );
}
