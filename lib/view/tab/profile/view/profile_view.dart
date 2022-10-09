import 'package:flutter/material.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("PROFILE"),
            TextButton(
                onPressed: () {
                  NavigationService.instance
                      .navigateToPage(path: NavigationConstants.TEST_VIEW);
                },
                child: const Text("Git"))
          ],
        ),
      ),
    );
  }
}
