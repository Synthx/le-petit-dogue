import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback? onMore;
  final String title;
  final Widget child;

  const HomeSection({
    required this.title,
    required this.child,
    this.onMore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Text(
            title.toUpperCase(),
            style: context.textTheme.titleMedium?.copyWith(
              color: context.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: kSpacer),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 70,
                color: context.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: kSafeArea,
                  vertical: kSafeArea,
                ),
              ),
            ),
            child,
          ],
        ),
        Container(
          color: context.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () => onMore?.call(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.t.seeMore.toUpperCase(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    PhosphorIcons.regular.arrowCircleRight,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
