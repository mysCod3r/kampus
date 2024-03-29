import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view.dart';

import '../viewmodel/details_view_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsViewModel>(
      viewModel: DetailsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        appBar: AppBar(title: Text(ModalRoute.of(context)!.settings.name!)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("PROFILE"),
              Text("${ModalRoute.of(context)?.settings.name}"),
              TextButton(
                  onPressed: () {
                    //viewModel.navigation.navigateToPage(context: context, path: "/test");
                  },
                  child: const Text("Git"))
            ],
          ),
        ),
      ),
    );
  }
}
