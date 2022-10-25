import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/view/tabs/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_view.dart';

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
        onPageBuilder: (context, viewModel) => body(context),
      ),
    );
  }

  Center _oldBody(HomeViewModel viewModel) {
    return Center(
      child: TextButton(
        onPressed: () => viewModel.navigateTo(NavigationConstants.PROFILE),
        child: const Text("Profile git"),
      ),
    );
  }

  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(ModalRoute.of(context)!.settings.name!),
          pinned: true,
          expandedHeight: 100,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return Text("data $index");
            },
          ),
        )
      ],
    );
  }
}
