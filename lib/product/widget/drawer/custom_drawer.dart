import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/product/enum/drawer_enum.dart';
import 'package:kampus/product/widget/button/drawer_user_button.dart';
import 'package:kampus/view/root/viewmodel/root_view_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.viewModel});
  final RootViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => viewModel.onHorizontalDragUpdate(details),
      onHorizontalDragEnd: (details) => viewModel.onHorizontalDragEnd(details),
      child: AnimatedContainer(
        color: Colors.red,
        duration: context.lowDuration,
        transform: Matrix4.translationValues(viewModel.xOffset - viewModel.drawerMaxWidth, 0, 0),
        height: double.infinity,
        width: viewModel.drawerMaxWidth,
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: context.paddingNormal,
                          child: Row(
                            children: [
                              Expanded(
                                child: DrawerUserButton(
                                  userModel: viewModel.currentUser,
                                  goProfile: () => viewModel.navigateTo(NavigationConstants.PROFILE),
                                  goFollowers: () => viewModel.navigateTo(NavigationConstants.FOLLOWERS),
                                  goFollowing: () => viewModel.navigateTo(NavigationConstants.FOLLOWING),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DrawerItemEnum.BOOKMARKS.toListTile(
                          () => viewModel.navigateTo("path"), // TODO FİXME
                        ),
                        DrawerItemEnum.SETTINGS.toListTile(
                          () => viewModel.navigateTo("path"), // TODO FİXME
                        ),
                        DrawerItemEnum.HELP.toListTile(
                          () => viewModel.navigateTo("path"), // TODO FİXME
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
