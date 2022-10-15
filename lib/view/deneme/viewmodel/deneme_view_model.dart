import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:mobx/mobx.dart';

class DenemeViewModel with Store, BaseViewModel {
  final GlobalKey<NavigatorState> key = GlobalKey();
  @override
  void setContext(BuildContext context) => contextt = context;

  @override
  void init() {}
}
