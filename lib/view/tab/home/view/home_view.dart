import 'package:flutter/material.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
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
