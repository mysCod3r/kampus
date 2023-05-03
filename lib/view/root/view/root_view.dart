import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/product/widget/bottom_bar/custom_bottom_bar.dart';
import 'package:kampus/product/widget/drawer/custom_drawer.dart';
import 'package:provider/provider.dart';

import '../../../core/base/base_view.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../viewmodel/root_view_model.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(
      builder: (context, provider, child) => BaseView<RootViewModel>(
        viewModel: RootViewModel(),
        onModelReady: (model) {
          log("RootView: onModelReady");
          model.setContext(context);
          model.init();
        },
        onDispose: () {
          log("RootView: onDispose");
        },
        onPageBuilder: (context, viewModel) {
          log("RootView: onPageBuilder");
          return Observer(
            builder: (context) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator.adaptive());
              } else {
                return Stack(
                  children: [
                    _buildScaffold(viewModel, context),
                    CustomDrawer(viewModel: viewModel),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildScaffold(RootViewModel viewModel, BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      transform: Matrix4.translationValues(viewModel.xOffset, 0, 0),
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () => viewModel.onWillPop(),
          child: _listViewBuilder(viewModel),
        ),
        bottomNavigationBar: CustomBottomBar(viewModel: viewModel),
      ),
    );
  }

  Widget _listViewBuilder(RootViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.tabPages.length,
      physics: const NeverScrollableScrollPhysics(),
      controller: viewModel.pageController,
      itemBuilder: (context, index) {
        return Navigator(
          key: viewModel.tabPages[index].navigatorkey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          onGenerateInitialRoutes: (navigator, initialRoute) {
            return [
              MaterialPageRoute(
                builder: (_) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => viewModel.onTap(),
                    onHorizontalDragUpdate: (details) => viewModel.onHorizontalDragUpdate(details),
                    onHorizontalDragEnd: (details) => viewModel.onHorizontalDragEnd(details),
                    child: AbsorbPointer(
                      absorbing: viewModel.isOpenDrawer,
                      child: viewModel.tabPages[index].tab,
                    )),
                settings: RouteSettings(name: viewModel.tabPages[index].title),
              ),
            ];
          },
        );
      },
    );
  }
}
