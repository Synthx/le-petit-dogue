import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'home_section.dart';
import 'home_store.dart';

class HomeNextMatches extends StatelessWidget {
  const HomeNextMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeStore, HomeState, List<Match>>(
      selector: (state) => state.nextMatches,
      builder: (context, matches) {
        return HomeSection(
          title: context.t.calendar,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              right: kSafeArea,
              bottom: kSpacer,
            ),
            margin: const EdgeInsets.only(
              left: kSafeArea,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: matches.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: index != 0 ? kDividerColor : Colors.transparent,
                height: 25,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return MatchCard(
                    match: matches[index],
                  );
                }

                return CompactMatchCard(
                  match: matches[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
