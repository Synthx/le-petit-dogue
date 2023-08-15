import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/theme/theme.dart';

import 'competition_standings_store.dart';
import 'competition_standings_table.dart';
import 'competition_standings_table_legend.dart';

class CompetitionStandingsScreen extends StatelessWidget {
  const CompetitionStandingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetitionStandingsStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(kSafeArea),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CompetitionStandingsTable(),
              SizedBox(height: kSpacer),
              CompetitionStandingsTableLegend(),
            ],
          ),
        ),
      ),
    );
  }
}
