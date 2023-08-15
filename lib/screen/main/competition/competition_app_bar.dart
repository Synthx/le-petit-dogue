import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';

class CompetitionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompetitionAppBar({super.key});

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
          indicatorColor: context.primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          tabs: [
            Tab(
              text: context.t.standings,
            ),
            Tab(
              text: context.t.calendar,
            ),
          ],
        ),
      ),
    );
  }
}
