import 'package:flutter/material.dart';

class RootItemModel {
  final Widget tab;
  final GlobalKey<NavigatorState> navigatorkey;
  final String title;

  RootItemModel({
    required this.tab,
    required this.title,
    required this.navigatorkey,
  });
}
