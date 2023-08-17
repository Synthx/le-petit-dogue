import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

import 'club_calendar_state.dart';

export 'club_calendar_state.dart';

class ClubCalendarStore extends Cubit<ClubCalendarState> {
  final DataStore dataStore;

  ClubCalendarStore({
    required this.dataStore,
  }) : super(initialClubCalendarState);

  Future init() async {
    final matches = dataStore.state.featuredTeamMatches
        .where((e) => !e.isFinished)
        .toList(growable: false);

    emit(state.copyWith(
      matches: matches,
    ));
  }
}
