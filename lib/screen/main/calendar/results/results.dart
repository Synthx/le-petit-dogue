import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'results_list.dart';
import 'results_store.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultsStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        body: ResultsList(),
      ),
    );
  }
}
