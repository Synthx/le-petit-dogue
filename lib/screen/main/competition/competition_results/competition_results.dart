import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'competition_results_app_bar.dart';
import 'competition_results_matches.dart';
import 'competition_results_store.dart';

class CompetitionResultsScreen extends StatelessWidget {
  const CompetitionResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetitionResultsStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        appBar: CompetitionResultsAppBar(),
        body: CompetitionResultsMatches(),
      ),
    );
  }
}
