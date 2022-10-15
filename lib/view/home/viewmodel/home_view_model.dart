import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/base_view_model.dart';

class HomeViewModel with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}
}
