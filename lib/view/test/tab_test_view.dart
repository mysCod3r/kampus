import 'package:flutter/material.dart';
import 'package:kampus/product/widget/bottom_navigation/bottom_navigation_widget.dart';

class TabTestView extends StatefulWidget {
  const TabTestView({super.key});

  @override
  State<TabTestView> createState() => _TabTestViewState();
}

class _TabTestViewState extends State<TabTestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tab Bar Test Screen")),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
