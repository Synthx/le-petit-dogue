import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'competition_results_store.dart';

class CompetitionResultsMatches extends StatelessWidget {
  const CompetitionResultsMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionResultsStore, CompetitionResultsState>(
      builder: (context, state) {
        final matches = state.matches[state.matchDay] ?? [];

        return ListView.separated(
          itemCount: matches.length,
          padding: const EdgeInsets.all(kSafeArea),
          separatorBuilder: (context, index) => const SizedBox(
            height: kSpacer,
          ),
          itemBuilder: (context, index) {
            return SmallMatchCard(
              backgroundColor: Theme.of(context).cardColor,
              match: matches[index],
            );
          },
        );
      },
    );
  }
}
