import 'package:flutter/material.dart';

import '../../../../product/widget/bottom_navigation/bottom_navigation_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: const Center(
        child: Text("CATEGORIES"),
      ),
    );
  }
}
