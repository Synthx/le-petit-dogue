import 'package:flutter/material.dart';
import 'package:jet_dogue/data/data.dart';

import 'standing_table_header.dart';
import 'standing_table_row.dart';

class StandingTable extends StatelessWidget {
  final List<Standing> standings;

  const StandingTable({
    required this.standings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rows = standings
        .map((e) => StandingTableRow(standing: e).build(context))
        .toList(growable: false);
    final header = StandingTableHeader().build(context);

    return Table(
      columnWidths: const {
        0: FixedColumnWidth(50),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(50),
        3: FixedColumnWidth(50),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        header,
        ...rows,
      ],
    );
  }
}
