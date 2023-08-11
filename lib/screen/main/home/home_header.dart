import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'home_store.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSafeArea,
      ),
      child: Row(
        children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
            height: 50,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocSelector<HomeStore, HomeState, Standing>(
                selector: (state) => state.featuredTeamStanding,
                builder: (context, standing) {
                  return Text(
                    context.t.position(standing.position),
                    style: context.textTheme.displayLarge?.copyWith(),
                  );
                },
              ),
              BlocSelector<HomeStore, HomeState, List<Match>>(
                selector: (state) => state.lastMatches,
                builder: (context, matches) {
                  if (matches.isEmpty) {
                    return Container();
                  }

                  return SizedBox(
                    height: 20,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: matches.length,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FormIcon(
                          match: matches[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
