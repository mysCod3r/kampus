import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view.dart';

import '../viewmodel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        appBar: AppBar(title: Text(ModalRoute.of(context)!.settings.name!)),
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text("DENEME 2 Git"),
          ),
        ),
      ),
    );
  }
}
