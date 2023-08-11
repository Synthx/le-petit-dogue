import 'package:flutter/material.dart';

export 'home/home.dart';
export 'squad/squad.dart';

class MainScreen extends StatelessWidget {
  final Widget child;

  const MainScreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
