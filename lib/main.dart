import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/init/lang/language_manager.dart';
import 'package:kampus/core/init/navigation/navigation_route.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';
import 'package:kampus/core/init/notifier/theme_notifier.dart';
import 'package:kampus/product/init/notifier/product_providers.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/provider_notifier.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [
      ...ApplicationProvider.instance.dependItems,
      ...ProductProvider.instance.uiChangesItems,
    ],
    child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: "assets/translations",
        startLocale: LanguageManager.instance.trLocale,
        child: const MyApp()),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
