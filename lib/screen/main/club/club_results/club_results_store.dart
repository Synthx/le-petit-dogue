import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

import 'club_results_state.dart';

export 'club_results_state.dart';

class ClubResultsStore extends Cubit<ClubResultsState> {
  final DataStore dataStore;

  ClubResultsStore({
    required this.dataStore,
  }) : super(initialClubResultsState);

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
