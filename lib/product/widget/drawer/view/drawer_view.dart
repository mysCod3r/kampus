import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kampus/product/enum/drawer_enum.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/product/widget/button/drawer_user_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/base_view.dart';
import '../viewmodel/drawer_view_model.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return BaseView<DrawerViewModel>(
      viewModel: DrawerViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Consumer<NavigationNotifier>(
        builder: (context, provider, child) => Observer(
          builder: (context) => SafeArea(
            child: Container(
              height: double.infinity,
              width: width,
              padding: const EdgeInsets.all(16.0),
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DrawerUserButton(
                                    userModel: viewModel.currentUser,
                                    goProfile: () => viewModel.goProfile(navigatorKey: provider.currentKey),
                                    goFollowers: () => viewModel.goProfile(navigatorKey: provider.currentKey),
                                    goFollowing: () => viewModel.goProfile(navigatorKey: provider.currentKey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          DrawerItemEnum.BOOKMARKS.toListTile(() {}),
                          DrawerItemEnum.SETTINGS.toListTile(() {}),
                          DrawerItemEnum.HELP.toListTile(() {}),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
