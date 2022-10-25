import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_view.dart';
import '../viewmodel/messages_view_model.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(
      builder: (context, provider, child) => BaseView<MessagesViewModel>(
        viewModel: MessagesViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => Center(
          child: TextButton(
            onPressed: () {},
            child: const Text("Profile git"),
          ),
        ),
      ),
    );
  }
}
