import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';

class CustomAppBar<T extends BaseViewModel> extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, this.scaffoldKey});
  // final T viewModel;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: TextButton(
            onPressed: () {
              if (scaffoldKey != null) {
                scaffoldKey!.currentState!.openDrawer();
              }
            },
            child: Text(ModalRoute.of(context)!.settings.name!)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget get child => throw UnimplementedError();
}
