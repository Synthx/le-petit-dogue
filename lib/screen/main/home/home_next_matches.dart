import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/screen/screen.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'home_section.dart';
import 'home_store.dart';

class HomeNextMatches extends StatelessWidget {
  const HomeNextMatches({super.key});

  void _onMore({required BuildContext context}) {
    context.goNamed(CalendarScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeStore, HomeState, List<Match>>(
      selector: (state) => state.nextMatches,
      builder: (context, matches) {
        return HomeSection(
          onMore: () => _onMore(
            context: context,
          ),
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
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return MatchCard(
                    match: matches[index],
                  );
                }

                return SmallMatchCard(
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
