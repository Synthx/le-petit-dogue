import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'club_results_store.dart';

class ClubResultsList extends StatelessWidget {
  const ClubResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ClubResultsStore, ClubResultsState, List<Match>>(
      selector: (state) => state.matches,
      builder: (context, matches) {
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
