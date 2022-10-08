import 'package:flutter/material.dart';

import '../../../../product/widget/bottom_navigation/bottom_navigation_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      body: Center(
        child: Text("CATEGORIES"),
      ),
    );
  }
}
