import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'competition_calendar_store.dart';

class CompetitionCalendarMatches extends StatelessWidget {
  const CompetitionCalendarMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionCalendarStore, CompetitionCalendarState>(
      builder: (context, state) {
        final matches = state.matches[state.matchDay] ?? [];

        return ListView.separated(
          itemCount: matches.length,
          padding: const EdgeInsets.all(kSafeArea),
          separatorBuilder: (context, index) => const SizedBox(
            height: kSpacer,
          ),
          itemBuilder: (context, index) {
            final match = matches[index];
            if (match.isFeatured) {
              return SmallFeaturedMatchCard(
                match: match,
              );
            }

            return SmallMatchCard(
              backgroundColor: Theme.of(context).cardColor,
              match: match,
            );
          },
        );
      },
    );
  }
}
