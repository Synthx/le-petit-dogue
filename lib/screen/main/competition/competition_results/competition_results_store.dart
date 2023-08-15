import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

import 'competition_results_state.dart';

export 'competition_results_state.dart';

class CompetitionResultsStore extends Cubit<CompetitionResultsState> {
  final DataStore dataStore;

  CompetitionResultsStore({
    required this.dataStore,
  }) : super(initialCompetitionResultsState);

  Future init() async {
    final matches = dataStore.state.matches.where((e) => e.isFinished);
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
