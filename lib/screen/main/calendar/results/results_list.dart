import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'results_store.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ResultsStore, ResultsState, List<Match>>(
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
