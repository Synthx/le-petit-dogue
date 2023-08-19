import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'club_calendar_store.dart';

class ClubCalendarHeader extends StatelessWidget {
  const ClubCalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ClubCalendarStore, ClubCalendarState, Match>(
      selector: (state) => state.matches.first,
      builder: (context, match) {
        return SliverToBoxAdapter(
          child: PageHeader(
            text: context.t.upcomingMatch,
            child: MatchCard(
              match: match,
            ),
          ),
        );
      },
    );
  }
}
