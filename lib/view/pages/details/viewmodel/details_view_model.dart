import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:mobx/mobx.dart';

class DetailsViewModel with Store, BaseViewModel {
  late final GlobalKey<NavigatorState> key;
  @override
  void setContext(BuildContext context) => contextt = context;

  @override
  void init() {
    key = GlobalKey();
  }
}
