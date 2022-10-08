import 'package:flutter/material.dart';
import 'package:kampus/product/widget/bottom_navigation/bottom_navigation_widget.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigation(),
      body: Center(
        child: Column(
          children: [
            const Text("PROFILE"),
            TextButton(
                onPressed: () {
                  NavigationService.instance.navigateToPageReplace(
                      path: NavigationConstants.TEST_VIEW);
                },
                child: const Text("Git"))
          ],
        ),
      ),
    );
  }
}
