import 'package:go_router/go_router.dart';
import 'package:jet_dogue/screen/screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Splash(
        child: child,
      ),
      routes: [
        ShellRoute(
          builder: (context, state, child) => MainScreen(
            child: child,
          ),
          routes: [
            GoRoute(
              path: '/',
              name: HomeScreen.name,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
