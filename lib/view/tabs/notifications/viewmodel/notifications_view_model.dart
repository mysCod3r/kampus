import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/base_view_model.dart';

part 'notifications_view_model.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}
}
