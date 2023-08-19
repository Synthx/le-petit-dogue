import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'club_calendar_header.dart';
import 'club_calendar_list.dart';
import 'club_calendar_store.dart';

class ClubCalendarScreen extends StatelessWidget {
  const ClubCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClubCalendarStore(
        dataStore: context.read(),
      )..init(),
      child: const Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ClubCalendarHeader(),
            ClubCalendarList(),
          ],
        ),
      ),
    );
  }
}
