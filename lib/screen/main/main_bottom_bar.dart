import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainBottomBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainBottomBar({
    required this.navigationShell,
    super.key,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      elevation: 1,
      iconSize: 30,
      onTap: (index) => _onTap(index),
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(PhosphorIcons.fill.houseSimple),
          icon: Icon(PhosphorIcons.regular.houseSimple),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(PhosphorIcons.fill.calendarBlank),
          icon: Icon(PhosphorIcons.regular.calendarBlank),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(PhosphorIcons.fill.trophy),
          icon: Icon(PhosphorIcons.regular.trophy),
          label: 'Competition',
        ),
      ],
    );
  }
}
