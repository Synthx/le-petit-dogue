import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';

class MatchScoreIndicator extends StatelessWidget {
  final MatchScore score;
  final Color? color;

  const MatchScoreIndicator({
    required this.score,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (score.winner == null) {
      return SizedBox(
        width: 30,
        child: Divider(
          thickness: 2,
          color: context.primaryColor,
        ),
      );
    }

    return Row(
      children: [
        Text(
          '${score.fullTime.home}',
          style: context.textTheme.titleLarge?.copyWith(
            color: score.winner == MatchScoreWinner.home
                ? context.primaryColor
                : color ?? context.secondaryColor,
            fontSize: 34,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSpacer,
          ),
          child: SizedBox(
            width: 20,
            child: Divider(
              thickness: 2,
              color: context.primaryColor,
            ),
          ),
        ),
        Text(
          '${score.fullTime.away}',
          style: context.textTheme.titleLarge?.copyWith(
            color: score.winner == MatchScoreWinner.away
                ? context.primaryColor
                : color ?? context.secondaryColor,
            fontSize: 34,
          ),
        ),
      ],
    );
  }
}
