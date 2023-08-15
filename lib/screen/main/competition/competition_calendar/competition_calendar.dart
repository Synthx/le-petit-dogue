import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'competition_calendar_app_bar.dart';
import 'competition_calendar_matches.dart';
import 'competition_calendar_store.dart';

class CompetitionCalendarScreen extends StatelessWidget {
  const CompetitionCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetitionCalendarStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        appBar: CompetitionCalendarMatchDay(),
        body: CompetitionCalendarMatches(),
      ),
    );
  }
}
