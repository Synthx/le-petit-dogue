import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';

class StandingTableHeader {
  TableRow build(BuildContext context) {
    final textStyle = context.textTheme.displayLarge?.copyWith(
      color: context.primaryColor,
      fontSize: 13,
    );

    return TableRow(
      children: [
        Container(),
        Container(),
        Center(
          child: Text(
            'Pts',
            style: textStyle,
          ),
        ),
        Center(
          child: Text(
            'Diff',
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
