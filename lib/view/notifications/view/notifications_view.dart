import 'package:flutter/material.dart';
import '../../../core/base/base_view.dart';
import '../viewmodel/notifications_view_model.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationsViewModel>(
      viewModel: NotificationsViewModel(),
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
