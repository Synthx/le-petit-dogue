import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jet_dogue/screen/screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      builder: (context, state, child) => Splash(
        child: child,
      ),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => MainScreen(
            navigationShell: navigationShell,
          ),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/',
                  name: HomeScreen.name,
                  builder: (context, state) => const HomeScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/club',
                  name: ClubScreen.name,
                  builder: (context, state) => const ClubScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/competition',
                  name: CompetitionScreen.name,
                  builder: (context, state) => const CompetitionScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
