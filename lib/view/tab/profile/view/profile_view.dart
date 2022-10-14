import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("PROFILE"),
            Text("${ModalRoute.of(context)?.settings.name}"),
            TextButton(
                onPressed: () {
                  NavigationService.instance.navigateToPage(path: NavigationConstants.TEST_VIEW, navigatorKey: context.read<NavigationNotifier>().currentKey);
                },
                child: const Text("Git"))
          ],
        ),
      ),
    );
  }
}
