import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kampus/view/root/viewmodel/root_view_model.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key, required this.viewModel});

  final RootViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          items: [
            BottomNavigationBarItem(
                label: viewModel.tabPages[0].title,
                icon: viewModel.currentIndex == 0
                    ? const Icon(
                        Icons.home_filled,
                      )
                    : const Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                label: viewModel.tabPages[0].title,
                icon: viewModel.currentIndex == 1
                    ? const Icon(
                        Icons.search,
                      )
                    : const Icon(Icons.search_outlined)),
            BottomNavigationBarItem(
                label: viewModel.tabPages[0].title,
                icon: viewModel.currentIndex == 2
                    ? const Icon(
                        Icons.notifications,
                      )
                    : const Icon(Icons.notifications_outlined)),
            BottomNavigationBarItem(
                label: viewModel.tabPages[0].title,
                icon: viewModel.currentIndex == 3
                    ? const Icon(
                        Icons.message,
                      )
                    : const Icon(Icons.message_outlined))
          ],
          onTap: (value) {
            // viewModel.authService.loginWithEmail(email: "a@a.edu.tr", password: "admin123");
            viewModel.setCurrentIndex(value);
            // provider.currentIndex = value;
          },
        );
      },
    );
  }
}
