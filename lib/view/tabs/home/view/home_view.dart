import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/view/tabs/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_view.dart';
import '../../../../product/widget/appbar/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(
      builder: (context, provider, child) => BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => Scaffold(
          key: viewModel.scaffoldKey,
          appBar: CustomAppBar(scaffoldKey: viewModel.scaffoldKey),
          drawer: const Drawer(),
          body: Center(
            child: TextButton(
              onPressed: () {
                viewModel.navigateToProfile(navigatorKey: provider.currentKey);
              },
              child: const Text("Profile git"),
            ),
          ),
        ),
      ),
    );
  }
}
