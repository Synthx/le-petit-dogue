import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

class SmallMatchCard extends StatelessWidget {
  final Color backgroundColor;
  final Match match;

  const SmallMatchCard({
    required this.match,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: context.textTheme.titleMedium?.copyWith(
                color: context.secondaryColor,
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
          RichText(
            text: TextSpan(
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.secondaryColor,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: match.date.format(DateFormat.ABBR_MONTH_WEEKDAY_DAY),
                ),
                if (match.status == MatchStatus.timed)
                  TextSpan(
                    text: ' · ',
                    style: TextStyle(
                      color: context.primaryColor,
                    ),
                  ),
                if (match.status == MatchStatus.timed)
                  TextSpan(
                    text: match.date.format(DateFormat.HOUR_MINUTE),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
