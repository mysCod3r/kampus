import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/init/lang/language_manager.dart';
import 'package:kampus/core/init/notifier/theme_notifier.dart';
import 'package:kampus/product/widget/bottom_navigation/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';

class SecondTestView extends StatefulWidget {
  const SecondTestView({super.key});

  @override
  State<SecondTestView> createState() => _SecondTestViewState();
}

class _SecondTestViewState extends State<SecondTestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      bottomNavigationBar: const CustomBottomNavigation(),
      body: Center(
        child:
            ElevatedButton(onPressed: () {}, child: const Text("EXPLORE NOW")),
      ),
    );
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
