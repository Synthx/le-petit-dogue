import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'main_bottom_bar.dart';

export 'calendar/calendar.dart';
export 'competition/competition.dart';
export 'home/home.dart';
export 'squad/squad.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomBar(
        navigationShell: navigationShell,
      ),
      body: navigationShell,
    );
  }
}
