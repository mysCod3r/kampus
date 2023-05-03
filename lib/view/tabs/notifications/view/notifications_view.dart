import 'package:flutter/material.dart';
import '../../../../core/base/base_view.dart';
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
      onPageBuilder: (context, viewModel) => Center(
        child: Text(ModalRoute.of(context)!.settings.name!),
      ),
    );
  }
}


//   Widget _buildDrawer(NotificationsViewModel viewModel, BuildContext context) => Observer(
//         builder: (_) => GestureDetector(
//           onHorizontalDragUpdate: (details) => viewModel.onHorizontalDragUpdate(details),
//           onHorizontalDragEnd: (details) => viewModel.onHorizontalDragEnd(details),
//           child: AnimatedContainer(
//             duration: context.lowDuration,
//             transform: Matrix4.translationValues(viewModel.xOffset - viewModel.drawerMaxWidth, 0, 0),
//             child: DrawerView(width: viewModel.drawerMaxWidth),
//           ),
//         ),
//       );

//   Widget _buildBody(NotificationsViewModel viewModel, BuildContext context) => Observer(
//       builder: (_) => GestureDetector(
//             onHorizontalDragUpdate: (details) => viewModel.onHorizontalDragUpdate(details),
//             onHorizontalDragEnd: (details) => viewModel.onHorizontalDragEnd(details),
//             onTap: () => viewModel.onTap(),
//             child: AnimatedContainer(
//               duration: context.lowDuration,
//               transform: Matrix4.translationValues(viewModel.xOffset, 0, 0),
//               child: const Center(child: Text("ModalRoute.of(context)!.settings.name!")),
//             ),
//           ));
// }

// Text(ModalRoute.of(context)!.settings.name!)
