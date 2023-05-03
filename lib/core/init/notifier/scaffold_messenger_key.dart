import 'package:flutter/material.dart';

class ScaffoldMessengerKey {
  static ScaffoldMessengerKey? _instace;
  static ScaffoldMessengerKey? get instance {
    _instace ??= ScaffoldMessengerKey._init();
    return _instace;
  }

  ScaffoldMessengerKey._init();

  final GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey();

  void showSnackBar({required String text, SnackBarAction? action, VoidCallback? voidCallback, double? keyboardPositon}) {
    scaffoldState.currentState!.showSnackBar(
      SnackBar(
        content: Text(text),
        action: action,
        onVisible: voidCallback,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: keyboardPositon != null ? EdgeInsets.only(bottom: keyboardPositon + 10, left: 10, right: 10) : null,
      ),
    );
  }
}
