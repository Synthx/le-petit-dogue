import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'competition_results_state.freezed.dart';

@freezed
class CompetitionResultsState with _$CompetitionResultsState {
  const factory CompetitionResultsState({
    required Map<int, List<Match>> matches,
    required int matchDay,
  }) = _CompetitionResultsState;
}

const initialCompetitionResultsState = CompetitionResultsState(
  matches: {},
  matchDay: 0,
);
