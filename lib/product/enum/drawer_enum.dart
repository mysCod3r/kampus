// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/core/init/lang/locale_keys.g.dart';
import 'package:kampus/product/widget/card/drawer_list_tile.dart';

enum DrawerItemEnum { SETTINGS, BOOKMARKS, HELP }

extension DrawerItemEnumExtension on DrawerItemEnum {
  String get localName {
    switch (this) {
      case DrawerItemEnum.SETTINGS:
        return LocaleKeys.drawer_settings.tr();
      case DrawerItemEnum.BOOKMARKS:
        return LocaleKeys.drawer_bookmarks.tr();
      case DrawerItemEnum.HELP:
        return LocaleKeys.drawer_help.tr();
    }
  }

  String get pathName {
    switch (this) {
      case DrawerItemEnum.SETTINGS:
        return NavigationConstants.SETTINGS;
      case DrawerItemEnum.BOOKMARKS:
        return NavigationConstants.BOOKMARKS;
      case DrawerItemEnum.HELP:
        return NavigationConstants.HELP;
    }
  }

  IconData get icon {
    switch (this) {
      case DrawerItemEnum.SETTINGS:
        return Icons.settings_outlined;
      case DrawerItemEnum.BOOKMARKS:
        return Icons.bookmark_border_outlined;
      case DrawerItemEnum.HELP:
        return Icons.help_outline_outlined;
    }
  }

  Widget toListTile(VoidCallback onTap) {
    return DrawerListTile(text: localName, icon: icon, onTap: onTap);
  }

  Widget toTextButton(VoidCallback onTap) {
    return TextButton(onPressed: onTap, child: const Text(""));
  }
}
