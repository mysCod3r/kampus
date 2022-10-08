import 'package:flutter/material.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../product/widget/bottom_navigation/bottom_navigation_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      body: Center(
        child: InkWell(
            onTap: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.TEST_VIEW);
            },
            child: const Text("HOME")),
      ),
    );
  }
}
