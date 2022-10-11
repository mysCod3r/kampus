import 'package:flutter/material.dart';

class RootModel {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  RootModel({
    required this.tab,
    required this.title,
    required this.icon,
    this.navigatorkey,
  });
}
