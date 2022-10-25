import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store, BaseViewModel {
  late GlobalKey<NavigatorState> currentKey;
  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {
    currentKey = contextt!.read<NavigationNotifier>().currentKey;
  }

  void navigateTo(String path) {
    navigation.navigateToPage(navigatorKey: currentKey, path: path);
  }
}
