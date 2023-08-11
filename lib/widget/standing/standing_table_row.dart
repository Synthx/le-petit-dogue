import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/widget/widget.dart';

class StandingTableRow {
  final Standing standing;

  const StandingTableRow({
    required this.standing,
  });

  TableRow build(BuildContext context) {
    final isFeatured = standing.team.id == kTeamId;
    final textStyle = context.textTheme.displayMedium?.copyWith(
      color: isFeatured ? context.primaryColor : context.secondaryColor,
      fontSize: 13,
      fontWeight: isFeatured ? FontWeight.w500 : FontWeight.normal,
    );

    return TableRow(
      children: [
        Center(
          child: Text(
            '${standing.position}',
            style: textStyle?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              TeamCrest(
                team: standing.team,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                standing.team.shortName,
                style: textStyle,
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            '${standing.points}',
            style: textStyle,
          ),
        ),
        Center(
          child: Text(
            '${standing.goalDifference}',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
