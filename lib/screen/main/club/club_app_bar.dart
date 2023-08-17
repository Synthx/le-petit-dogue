import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';

class ClubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClubAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SizedBox(
        height: kToolbarHeight,
        child: TabBar(
          isScrollable: true,
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          tabs: [
            Tab(
              text: context.t.calendar,
            ),
            Tab(
              text: context.t.results,
            ),
            Tab(
              text: context.t.squad,
            ),
          ],
        ),
      ),
    );
  }
}
