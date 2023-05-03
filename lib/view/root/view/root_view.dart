import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/product/widget/bottom_navigation/bottom_navigation_widget.dart';
import 'package:kampus/view/_product/_constants/image_path_svg.dart';
import 'package:kampus/view/root/viewmodel/root_view_model.dart';

import '../../../core/init/navigation/navigation_route.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<NavigationNotifier>().onWillPop,
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
          bottomNavigationBar: CustomBottomNavigation(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(context.watch<NavigationNotifier>().currentPath),
      leading: InkWell(
        //    onTap: () => Scaffold.of(context).openDrawer(),
        child: SvgPicture.asset(SVGImagePaths.instance!.onboardSVG1),
      ),
    );
  }

  IndexedStack _buildBody(BuildContext context) {
    return IndexedStack(
      index: context.watch<NavigationNotifier>().currentIndex,
      children: context
          .read<RootViewModel>()
          .pages
          .map((page) => Navigator(
                key: page.navigatorkey,
                onGenerateRoute: NavigationRoute.instance.generateRoute,
                onGenerateInitialRoutes: (navigator, initialRoute) {
                  return [MaterialPageRoute(builder: (context) => page.tab, settings: RouteSettings(name: page.title))];
                },
              ))
          .toList(),
    );
  }
}
