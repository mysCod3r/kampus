import 'package:flutter/material.dart';
import 'package:kampus/view/home/viewmodel/home_view_model.dart';
import '../../../core/base/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {},
            //  onPressed: () => viewModel.navigation.navigateToPage(context: context, path: NavigationConstants.DENEME),
            child: const Text("Denemeye git"),
          ),
        ),
      ),
    );
  }
}
