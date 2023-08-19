import 'package:flutter/material.dart';

import 'club_app_bar.dart';
import 'club_calendar/club_calendar.dart';
import 'club_results/club_results.dart';
import 'club_squad/club_squad.dart';

class ClubScreen extends StatelessWidget {
  static String name = 'club';

  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ClubAppBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ClubCalendarScreen(),
            ClubResultsScreen(),
            ClubSquadScreen(),
          ],
        ),
      ),
    );
  }
}
