import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CompactMatchCard extends StatelessWidget {
  final Match match;

  const CompactMatchCard({
    required this.match,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      match.home.shortName,
                      textAlign: TextAlign.right,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TeamCrest(
                    team: match.home,
                  ),
                ],
              ),
            ),
            const SizedBox(width: kSpacer),
            Icon(
              PhosphorIcons.regular.x,
              color: context.textTheme.bodySmall?.color,
              size: 26,
            ),
            const SizedBox(width: kSpacer),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TeamCrest(
                    team: match.away,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      match.away.shortName,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: kSpacer),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              PhosphorIcons.regular.calendarBlank,
              color: context.textTheme.bodySmall?.color,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              match.date.format(DateFormat.ABBR_MONTH_WEEKDAY_DAY),
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.copyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
