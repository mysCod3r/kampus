import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/bottom_navigation_bar_notifier.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<BottomNavigationBarNotifier>().currentIndex,
      items: [
        BottomNavigationBarItem(
            label: "",
            icon: context.read<BottomNavigationBarNotifier>().currentIndex == 0
                ? const Icon(
                    Icons.home_filled,
                  )
                : const Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
            label: "",
            icon: context.read<BottomNavigationBarNotifier>().currentIndex == 1
                ? const Icon(
                    Icons.category,
                  )
                : const Icon(Icons.category_outlined)),
        BottomNavigationBarItem(
            label: "",
            icon: context.read<BottomNavigationBarNotifier>().currentIndex == 2
                ? const Icon(
                    Icons.notifications,
                  )
                : const Icon(Icons.notifications_outlined)),
        BottomNavigationBarItem(
            label: "",
            icon: context.read<BottomNavigationBarNotifier>().currentIndex == 3
                ? const Icon(
                    Icons.person,
                  )
                : const Icon(Icons.person_outline))
      ],
      onTap: (value) {
        context.read<BottomNavigationBarNotifier>().currentIndex = value;
      },
    );
  }
}
