import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'club_squad_store.dart';

class ClubSquadGrid extends StatelessWidget {
  const ClubSquadGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubSquadStore, ClubSquadState>(
      builder: (context, state) {
        if (state.loading) {
          return Container(
            height: 200,
            color: Colors.white,
            padding: const EdgeInsets.all(kSpacer),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final players = state.players;
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: kSafeArea,
            mainAxisSpacing: kSafeArea,
          ),
          itemCount: players.length,
          itemBuilder: (context, index) {
            return PersonCard(
              person: players[index],
            );
          },
        );
      },
    );
  }
}
