import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/init/lang/language_manager.dart';
import 'package:kampus/core/init/navigation/navigation_route.dart';
import 'package:kampus/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/init/notifier/provider_notifier.dart';
import 'product/init/notifier/product_providers.dart';

Future<void> main() async {
  await _init();
  runApp(MultiProvider(
    providers: [
      ...ApplicationProvider.instance.keys,
      ...ApplicationProvider.instance.dependItems,
      ...ProductProvider.instance.authItems,
      //...ProductProvider.instance.uiChangesItems,
    ],
    child: EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: "assets/translations",
      startLocale: LanguageManager.instance.trLocale,
      child: const MyApp(),
    ),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    );
  }
}
