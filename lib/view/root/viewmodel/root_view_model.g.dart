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
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
