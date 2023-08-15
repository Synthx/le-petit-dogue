import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

import 'competition_standings_state.dart';

export 'competition_standings_state.dart';

class CompetitionStandingsStore extends Cubit<CompetitionStandingsState> {
  final DataStore dataStore;

  CompetitionStandingsStore({
    required this.dataStore,
  }) : super(initialCompetitionStandingsState);

  Future init() async {
    emit(state.copyWith(
      standings: dataStore.state.standings,
    ));
  }
}
