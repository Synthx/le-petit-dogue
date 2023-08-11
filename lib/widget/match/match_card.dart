import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({
    required this.match,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.primaryColor,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            context.t.matchDay(match.matchday),
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TeamCrest(
                      team: match.home,
                      size: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      match.home.shortName,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      match.date.format(DateFormat.HOUR_MINUTE),
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    relativeTimeToMatch(context),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    TeamCrest(
                      team: match.away,
                      size: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      match.away.shortName,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                PhosphorIcons.regular.calendarBlank,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 5),
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

  Widget relativeTimeToMatch(BuildContext context) {
    final now = DateTime.now();
    final difference = match.date.difference(now);

    var timeLeft = context.t.countdownDays(difference.inDays);
    if (difference.isNegative) {
      timeLeft = context.t.countdownLive;
    } else if (difference.inDays == 0) {
      if (difference.inHours > 0) {
        timeLeft = context.t.countdownHours(difference.inHours);
      } else {
        timeLeft = context.t.countdownMinutes(difference.inMinutes);
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),
      child: Text(
        timeLeft,
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
