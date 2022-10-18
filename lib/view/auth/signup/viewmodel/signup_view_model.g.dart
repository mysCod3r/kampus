// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupViewModel on SignupViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SignupViewModelBase.isLoading', context: context);

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

  late final _$isLockAtom =
      Atom(name: 'SignupViewModelBase.isLock', context: context);

  @override
  bool get isLock {
    _$isLockAtom.reportRead();
    return super.isLock;
  }

  @override
  set isLock(bool value) {
    _$isLockAtom.reportWrite(value, super.isLock, () {
      super.isLock = value;
    });
  }

  late final _$signupAsyncAction =
      AsyncAction('SignupViewModelBase.signup', context: context);

  @override
  Future<void> signup() {
    return _$signupAsyncAction.run(() => super.signup());
  }

  late final _$SignupViewModelBaseActionController =
      ActionController(name: 'SignupViewModelBase', context: context);

  @override
  void isLockChange() {
    final _$actionInfo = _$SignupViewModelBaseActionController.startAction(
        name: 'SignupViewModelBase.isLockChange');
    try {
      return super.isLockChange();
    } finally {
      _$SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingChange() {
    final _$actionInfo = _$SignupViewModelBaseActionController.startAction(
        name: 'SignupViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLock: ${isLock}
    ''';
  }
}
