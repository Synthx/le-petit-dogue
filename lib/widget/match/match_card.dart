import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({
    required this.match,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.secondaryColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CountDown(
            date: match.date,
          ),
          const SizedBox(
            height: kSpacer,
          ),
          RichText(
            text: TextSpan(
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: match.home.shortName.toUpperCase(),
                ),
                TextSpan(
                  text: '  /  ',
                  style: TextStyle(
                    color: context.primaryColor,
                  ),
                ),
                TextSpan(
                  text: match.away.shortName.toUpperCase(),
                ),
              ],
            ),
          ),
          const SizedBox(height: kSpacer),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamCrest(
                team: match.home,
              ),
              const SizedBox(width: kSpacer),
              SizedBox(
                width: 30,
                child: Divider(
                  thickness: 2,
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(width: kSpacer),
              TeamCrest(
                team: match.away,
              ),
            ],
          ),
          const SizedBox(height: kSpacer),
          Column(
            children: [
              Text(
                match.date.format(DateFormat.HOUR_MINUTE),
                textAlign: TextAlign.center,
                style: context.textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                match.date.format(DateFormat.MONTH_WEEKDAY_DAY),
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
