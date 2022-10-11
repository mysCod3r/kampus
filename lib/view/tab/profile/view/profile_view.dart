import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/bottom_navigation_bar_notifier.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("PROFILE"),
            TextButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const TestView(),
                  // ));

                  NavigationService.instance.navigateToPage(path: NavigationConstants.TEST_VIEW, tabIndex: context.read<BottomNavigationBarNotifier>().currentIndex);
                },
                child: const Text("Git"))
          ],
        ),
      ),
    );
  }
}
