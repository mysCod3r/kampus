import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/base_view_model.dart';

part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store, BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}
}
