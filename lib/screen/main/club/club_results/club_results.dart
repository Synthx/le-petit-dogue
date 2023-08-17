import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'club_results_list.dart';
import 'club_results_store.dart';

class ClubResultsScreen extends StatelessWidget {
  const ClubResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClubResultsStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        body: ClubResultsList(),
      ),
    );
  }
}
