import 'package:flutter/material.dart';

import 'competition_app_bar.dart';
import 'competition_calendar/competition_calendar.dart';
import 'competition_results/competition_results.dart';
import 'competition_standings/competition_standings.dart';

class CompetitionScreen extends StatelessWidget {
  static String name = 'CompetitionScreen';

  const CompetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CompetitionAppBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CompetitionStandingsScreen(),
            CompetitionCalendarScreen(),
            CompetitionResultsScreen(),
          ],
        ),
      ),
    );
  }
}
