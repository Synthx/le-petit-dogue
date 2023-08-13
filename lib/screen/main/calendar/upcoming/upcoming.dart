import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'upcoming_header.dart';
import 'upcoming_list.dart';
import 'upcoming_store.dart';

class UpcomingMatchesScreen extends StatelessWidget {
  const UpcomingMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpcomingMatchesStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            UpcomingMatchesHeader(),
            UpcomingMatchesList(),
          ],
        ),
      ),
    );
  }
}
