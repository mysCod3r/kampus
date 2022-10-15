import 'package:flutter/material.dart';
import '../../../core/base/base_view.dart';
import '../viewmodel/messages_view_model.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MessagesViewModel>(
      viewModel: MessagesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        body: Center(
          child: Text(ModalRoute.of(context)!.settings.name!),
        ),
      ),
    );
  }
}
