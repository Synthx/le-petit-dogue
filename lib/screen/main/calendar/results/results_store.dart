import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

import 'results_state.dart';

export 'results_state.dart';

class ResultsStore extends Cubit<ResultsState> {
  final DataStore dataStore;

  ResultsStore({
    required this.dataStore,
  }) : super(initialResultsState);

  Future init() async {
    final matches = dataStore.state.featuredTeamMatches
        .where((e) => e.isFinished)
        .toList(growable: false);
    matches.sort((a, b) => b.date.compareTo(a.date));

    emit(state.copyWith(
      matches: matches,
    ));
  }
}
