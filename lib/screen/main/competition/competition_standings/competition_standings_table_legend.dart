import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';

class CompetitionStandingsTableLegend extends StatelessWidget {
  const CompetitionStandingsTableLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.standingsTableLegendNote,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
