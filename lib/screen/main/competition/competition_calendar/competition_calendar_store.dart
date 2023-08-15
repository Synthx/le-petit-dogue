import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';
import 'package:collection/collection.dart';

import 'competition_calendar_state.dart';
export 'competition_calendar_state.dart';

class CompetitionCalendarStore extends Cubit<CompetitionCalendarState> {
  final DataStore dataStore;

  CompetitionCalendarStore({
    required this.dataStore,
  }) : super(initialCompetitionCalendarState);

  Future init() async {
    final matches = dataStore.state.matches.where((e) => !e.isFinished);

    final data = groupBy(matches, (e) => e.matchday);
    emit(state.copyWith(
      matches: data,
      matchDay: data.keys.first,
    ));
  }

  Future nextMatchDay() async {
    final matchDay = state.matchDay + 1;
    if (state.matches.containsKey(matchDay)) {
      emit(state.copyWith(
        matchDay: matchDay,
      ));
    }
  }

  Future previousMatchDay() async {
    final matchDay = state.matchDay - 1;
    if (state.matches.containsKey(matchDay)) {
      emit(state.copyWith(
        matchDay: matchDay,
      ));
    }
  }
}
