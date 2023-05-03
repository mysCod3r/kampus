import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/navigation_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              context.read<NavigationNotifier>().navigateToPage(path: NavigationConstants.TEST_VIEW);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HOME"),
                Text("${ModalRoute.of(context)?.settings.name}"),
              ],
            )),
      ),
    );
  }
}
