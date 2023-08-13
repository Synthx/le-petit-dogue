import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';

class PageHeader extends StatelessWidget {
  final String text;
  final Widget child;

  const PageHeader({
    required this.text,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.primaryColor;

    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: backgroundColor,
          padding: const EdgeInsets.only(
            top: kSafeArea,
            left: kSafeArea,
            right: kSafeArea,
          ),
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              color: backgroundColor,
              height: 1,
              fontSize: 32,
              shadows: const [
                Shadow(
                  offset: Offset(-1, -1),
                  color: Colors.white,
                ),
                Shadow(
                  offset: Offset(1, -1),
                  color: Colors.white,
                ),
                Shadow(
                  offset: Offset(1, 1),
                  color: Colors.white,
                ),
                Shadow(
                  offset: Offset(-1, 1),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                color: backgroundColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: kSpacer,
                left: kSafeArea,
                right: kSafeArea,
              ),
              child: child,
            ),
          ],
        ),
      ],
    );
  }
}
