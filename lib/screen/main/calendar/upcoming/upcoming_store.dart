import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

import 'upcoming_state.dart';

export 'upcoming_state.dart';

class UpcomingMatchesStore extends Cubit<UpcomingMatchesState> {
  final DataStore dataStore;

  UpcomingMatchesStore({
    required this.dataStore,
  }) : super(initialUpcomingMatchesState);

  Future init() async {
    final matches = dataStore.state.featuredTeamMatches
        .where((e) => !e.isFinished)
        .toList();

    emit(state.copyWith(
      matches: matches,
    ));
  }
}
