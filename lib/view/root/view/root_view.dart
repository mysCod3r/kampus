import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
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
          log("RootView: build");

          log("RootView: onPageBuilder");
          return Observer(
            builder: (context) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator.adaptive());
              } else {
                return _buildScaffold(viewModel, provider);
              }
            },
          );
        },
      ),
    );
  }

  Scaffold _buildScaffold(RootViewModel viewModel, NavigationNotifier provider) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      //drawer: _buildDrawer(viewModel),
      // appBar: _buildAppBar(viewModel),
      body: _buildBody(viewModel),
      bottomNavigationBar: _buildBottomBar(viewModel, provider),
    );
  }

  Drawer _buildDrawer(RootViewModel viewModel) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                viewModel.scaffoldKey.currentState!.closeDrawer();
                viewModel.navigateToProfile();
                viewModel.signOut();
              },
              child: Text("${viewModel.currentUser?.name}"),
            ),
          )
        ],
      ),
    );
  }

  Observer _buildBottomBar(RootViewModel viewModel, NavigationNotifier provider) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        items: [
          BottomNavigationBarItem(
              label: viewModel.tabPages[0].title,
              icon: viewModel.currentIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                    )
                  : const Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              label: viewModel.tabPages[0].title,
              icon: viewModel.currentIndex == 1
                  ? const Icon(
                      Icons.search,
                    )
                  : const Icon(Icons.search_outlined)),
          BottomNavigationBarItem(
              label: viewModel.tabPages[0].title,
              icon: viewModel.currentIndex == 2
                  ? const Icon(
                      Icons.notifications,
                    )
                  : const Icon(Icons.notifications_outlined)),
          BottomNavigationBarItem(
              label: viewModel.tabPages[0].title,
              icon: viewModel.currentIndex == 3
                  ? const Icon(
                      Icons.message,
                    )
                  : const Icon(Icons.message_outlined))
        ],
        onTap: (value) {
          viewModel.setCurrentIndex(value);
          provider.currentIndex = value;
        },
      );
    });
  }

  Widget _buildBody(RootViewModel viewModel) {
    return WillPopScope(
      onWillPop: () => viewModel.onWillPop(),
      child: SafeArea(
        child: _listViewBuilder(viewModel),
      ),
    );
  }

  // IndexedStack _indexedStack(RootViewModel viewModel) {
  //   return IndexedStack(
  //     index: viewModel.currentIndex,
  //     children: viewModel.tabPages
  //         .map((page) => Navigator(
  //               key: page.navigatorkey,
  //               onGenerateRoute: NavigationRoute.instance.generateRoute,
  //               onGenerateInitialRoutes: (navigator, _) {
  //                 return [MaterialPageRoute(builder: (_) => page.tab, settings: RouteSettings(name: page.title))];
  //               },
  //             ))
  //         .toList(),
  //   );
  // }

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
                builder: (_) => viewModel.tabPages[index].tab,
                settings: RouteSettings(name: viewModel.tabPages[index].title),
              ),
            ];
          },
        );
      },
    );
  }

  AppBar _buildAppBar(RootViewModel viewModel) {
    return AppBar(
      title: Observer(builder: (_) {
        switch (viewModel.currentIndex) {
          case 0:
            return const Text(NavigationConstants.HOME);
          case 1:
            return const Text(NavigationConstants.SEARCH);
          case 2:
            return const Text(NavigationConstants.NOTIFICATIONS);
          case 3:
            return const Text(NavigationConstants.MESSAGES);
          default:
        }
        return const Text(NavigationConstants.HOME);
      }),
      leading: IconButton(
        onPressed: () => viewModel.scaffoldKey.currentState!.openDrawer(),
        icon: const Icon(Icons.person),
      ),
    );
  }
}
