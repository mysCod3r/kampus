import 'package:flutter/material.dart';
import 'package:kampus/view/root/viewmodel/root_view_model.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/base_view_model.dart';

part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase extends RootViewModel with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}
}
