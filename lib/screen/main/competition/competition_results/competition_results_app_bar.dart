import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'competition_results_store.dart';

class CompetitionResultsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CompetitionResultsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _nextMatchDay({
    required BuildContext context,
  }) {
    context.read<CompetitionResultsStore>().nextMatchDay();
  }

  void _previousMatchDay({
    required BuildContext context,
  }) {
    context.read<CompetitionResultsStore>().previousMatchDay();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionResultsStore, CompetitionResultsState>(
      builder: (context, state) {
        final matchDay = state.matchDay;
        final matchDays = state.matches.keys;

        return AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          titleSpacing: kSafeArea,
          title: Row(
            children: [
              IconButton(
                onPressed: matchDay > matchDays.first
                    ? () => _previousMatchDay(context: context)
                    : null,
                icon: Icon(PhosphorIcons.regular.caretLeft),
              ),
              Expanded(
                child: Text(
                  context.t.matchDay(matchDay),
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: matchDay < matchDays.last
                    ? () => _nextMatchDay(context: context)
                    : null,
                icon: Icon(PhosphorIcons.regular.caretRight),
              ),
            ],
          ),
        );
      },
    );
  }
}
