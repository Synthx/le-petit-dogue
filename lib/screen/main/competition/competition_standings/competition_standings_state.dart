import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'competition_standings_state.freezed.dart';

@freezed
class CompetitionStandingsState with _$CompetitionStandingsState {
  const factory CompetitionStandingsState({
    required List<Standing> standings,
  }) = _CompetitionStandingsState;
}

const initialCompetitionStandingsState = CompetitionStandingsState(
  standings: [],
);
