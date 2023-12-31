import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'club_calendar_store.dart';

class ClubCalendarList extends StatelessWidget {
  const ClubCalendarList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ClubCalendarStore, ClubCalendarState, List<Match>>(
      selector: (state) => state.matches.sublist(1),
      builder: (context, matches) {
        return SliverList.separated(
          itemCount: matches.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: kSpacer,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: kSafeArea,
              ),
              child: SmallMatchCard(
                backgroundColor: Theme.of(context).cardColor,
                match: matches[index],
              ),
            );
          },
        );
      },
    );
  }
}
