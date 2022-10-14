import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({super.key});
  final List<String> _itemLabels = [
    NavigationConstants.HOME,
    NavigationConstants.CATEGORIES,
    NavigationConstants.NOTIFICATIONS,
    NavigationConstants.PROFILE,
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<NavigationNotifier>().currentIndex,
      items: [
        BottomNavigationBarItem(
            label: _itemLabels[0],
            icon: context.read<NavigationNotifier>().currentIndex == 0
                ? const Icon(
                    Icons.home_filled,
                  )
                : const Icon(Icons.home_outlined)),
        BottomNavigationBarItem(
            label: _itemLabels[1],
            icon: context.read<NavigationNotifier>().currentIndex == 1
                ? const Icon(
                    Icons.category,
                  )
                : const Icon(Icons.category_outlined)),
        BottomNavigationBarItem(
            label: _itemLabels[2],
            icon: context.read<NavigationNotifier>().currentIndex == 2
                ? const Icon(
                    Icons.notifications,
                  )
                : const Icon(Icons.notifications_outlined)),
        BottomNavigationBarItem(
            label: _itemLabels[3],
            icon: context.read<NavigationNotifier>().currentIndex == 3
                ? const Icon(
                    Icons.person,
                  )
                : const Icon(Icons.person_outline))
      ],
      onTap: (value) {
        context.read<NavigationNotifier>().currentIndex = value;
        context.read<NavigationNotifier>().currentPath = _itemLabels[value];
      },
    );
  }
}
