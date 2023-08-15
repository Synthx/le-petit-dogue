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

class HomeStanding extends StatelessWidget {
  const HomeStanding({super.key});

  void _onMore({
    required BuildContext context,
  }) {
    context.goNamed(CompetitionScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeStore, HomeState, List<Standing>>(
      selector: (state) => state.standings,
      builder: (context, standings) {
        return HomeSection(
          onMore: () => _onMore(
            context: context,
          ),
          title: context.t.standings,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              right: kSafeArea,
              bottom: kSpacer,
            ),
            margin: const EdgeInsets.only(
              left: kSafeArea,
            ),
            child: StandingTable(
              standings: standings,
            ),
          ),
        );
      },
    );
  }
}
