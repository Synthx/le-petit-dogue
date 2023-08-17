import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/widget/widget.dart';

import 'club_squad_grid.dart';
import 'club_squad_store.dart';

class ClubSquadScreen extends StatelessWidget {
  const ClubSquadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClubSquadStore(
        squadService: getIt(),
      )..init(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              PageHeader(
                text: context.t.squad,
                child: const ClubSquadGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
