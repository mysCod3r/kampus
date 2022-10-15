import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/base_view.dart';
import '../../../core/init/navigation/navigation_route.dart';
import '../viewmodel/root_view_model.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RootViewModel>(
      viewModel: RootViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    viewModel.scaffoldKey.currentState!.closeDrawer();
                    viewModel.navigateToProfile();
                  },
                  child: const Text("PROFİLE"),
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("ss"),
          leading: IconButton(
            onPressed: () => viewModel.scaffoldKey.currentState!.openDrawer(),
            icon: const Icon(Icons.person),
          ),
        ),
        body: Observer(builder: (_) {
          return WillPopScope(
            onWillPop: () => viewModel.onWillPop(),
            child: SafeArea(
              child: IndexedStack(
                index: viewModel.currentIndex,
                children: viewModel.tabPages
                    .map((page) => Navigator(
                          key: page.navigatorkey,
                          onGenerateRoute: NavigationRoute.instance.generateRoute,
                          onGenerateInitialRoutes: (navigator, _) {
                            return [MaterialPageRoute(builder: (_) => page.tab, settings: RouteSettings(name: page.title))];
                          },
                        ))
                    .toList(),
              ),
            ),
          );
        }),
        bottomNavigationBar: Observer(builder: (_) {
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
              viewModel.currentIndex = value;
            },
          );
        }),
      ),
    );
  }
}
