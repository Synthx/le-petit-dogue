import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';

class StandingTableHeader {
  TableRow build(BuildContext context) {
    final textStyle = context.textTheme.displayLarge?.copyWith(
      color: context.primaryColor,
      fontSize: 11,
    );

    return TableRow(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(),
        Center(
          child: Text(
            context.t.standingsTableHeaderGoalDifference,
            style: textStyle,
          ),
        ),
        Center(
          child: Text(
            context.t.standingsTableHeaderPoints,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
