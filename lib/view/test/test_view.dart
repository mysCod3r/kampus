import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/core/init/lang/language_manager.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';
import 'package:kampus/core/init/notifier/theme_notifier.dart';
import 'package:kampus/product/widget/bottom_navigation/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';

import '../../core/init/lang/locale_keys.g.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      bottomNavigationBar: const CustomBottomNavigation(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.current.tr()),
            changeTheme(context),
            changeLanguage(context),
            goSecondPage(),
          ],
        ),
      ),
    );
  }

  TextButton goSecondPage() {
    return TextButton(
        onPressed: () {
          NavigationService.instance
              .navigateToPage(path: NavigationConstants.SECOND_TEST_VIEW);
        },
        child: const Text("2. Sayfaya Git"));
  }

  TextButton changeTheme(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<ThemeNotifier>().changeTheme();
        },
        child: const Text("Tema Değiştir"));
  }

  TextButton changeLanguage(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (EasyLocalization.of(context)!.currentLocale ==
              LanguageManager.instance.trLocale) {
            context.setLocale(LanguageManager.instance.enLocale);
          } else {
            context.setLocale(LanguageManager.instance.trLocale);
          }
        },
        child: const Text("Dil Değiştir"));
  }
}
