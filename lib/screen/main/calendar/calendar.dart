import 'package:flutter/material.dart';

import 'calendar_app_bar.dart';
import 'results/results.dart';
import 'upcoming/upcoming.dart';

class CalendarScreen extends StatelessWidget {
  static String name = 'CalendarScreen';

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CalendarAppBar(),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            UpcomingMatchesScreen(),
            ResultsScreen(),
          ],
        ),
      ),
    );
  }
}
