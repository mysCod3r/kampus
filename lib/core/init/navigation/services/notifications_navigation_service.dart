import 'package:flutter/material.dart';

class NotificationsNavigationService {
  static final NotificationsNavigationService _instance = NotificationsNavigationService._init();
  static NotificationsNavigationService get instance => _instance;

  NotificationsNavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "notifications");
}
