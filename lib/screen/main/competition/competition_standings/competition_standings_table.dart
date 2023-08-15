import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'competition_standings_store.dart';

class CompetitionStandingsTable extends StatelessWidget {
  const CompetitionStandingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CompetitionStandingsStore, CompetitionStandingsState,
        List<Standing>>(
      selector: (state) => state.standings,
      builder: (context, standings) {
        return StandingTable(
          standings: standings,
        );
      },
    );
  }
}
