// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RootViewModel on _RootViewModelBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_RootViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$xOffsetAtom =
      Atom(name: '_RootViewModelBase.xOffset', context: context);

  @override
  double get xOffset {
    _$xOffsetAtom.reportRead();
    return super.xOffset;
  }

  @override
  set xOffset(double value) {
    _$xOffsetAtom.reportWrite(value, super.xOffset, () {
      super.xOffset = value;
    });
  }

  late final _$isOpenDrawerAtom =
      Atom(name: '_RootViewModelBase.isOpenDrawer', context: context);

  @override
  bool get isOpenDrawer {
    _$isOpenDrawerAtom.reportRead();
    return super.isOpenDrawer;
  }

  @override
  set isOpenDrawer(bool value) {
    _$isOpenDrawerAtom.reportWrite(value, super.isOpenDrawer, () {
      super.isOpenDrawer = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RootViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_RootViewModelBaseActionController =
      ActionController(name: '_RootViewModelBase', context: context);

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$_RootViewModelBaseActionController.startAction(
        name: '_RootViewModelBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_RootViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    final _$actionInfo = _$_RootViewModelBaseActionController.startAction(
        name: '_RootViewModelBase.onHorizontalDragUpdate');
    try {
      return super.onHorizontalDragUpdate(details);
    } finally {
      _$_RootViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragEnd(DragEndDetails details) {
    final _$actionInfo = _$_RootViewModelBaseActionController.startAction(
        name: '_RootViewModelBase.onHorizontalDragEnd');
    try {
      return super.onHorizontalDragEnd(details);
    } finally {
      _$_RootViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTap() {
    final _$actionInfo = _$_RootViewModelBaseActionController.startAction(
        name: '_RootViewModelBase.onTap');
    try {
      return super.onTap();
    } finally {
      _$_RootViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openDrawer() {
    final _$actionInfo = _$_RootViewModelBaseActionController.startAction(
        name: '_RootViewModelBase.openDrawer');
    try {
      return super.openDrawer();
    } finally {
      _$_RootViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_RootViewModelBaseActionController.startAction(
        name: '_RootViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_RootViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
xOffset: ${xOffset},
isOpenDrawer: ${isOpenDrawer},
isLoading: ${isLoading}
    ''';
  }
}
