import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view.dart';

import '../viewmodel/deneme_view_model.dart';

class DenemeView extends StatelessWidget {
  const DenemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DenemeViewModel>(
      viewModel: DenemeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        appBar: AppBar(title: Text(ModalRoute.of(context)!.settings.name!)),
        body: Center(
          child: TextButton(
            onPressed: () {},
            // onPressed: () => viewModel.navigateTo(NavigationConstants.DENEME2),
            child: const Text("DENEME 2 Git"),
          ),
        ),
      ),
    );
  }
}
