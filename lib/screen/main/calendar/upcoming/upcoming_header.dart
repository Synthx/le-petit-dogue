import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'upcoming_store.dart';

class UpcomingMatchesHeader extends StatelessWidget {
  const UpcomingMatchesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UpcomingMatchesStore, UpcomingMatchesState, Match>(
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
