import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'club_results_state.freezed.dart';

@freezed
class ClubResultsState with _$ClubResultsState {
  const factory ClubResultsState({
    required List<Match> matches,
  }) = _ClubResultsState;
}

const initialClubResultsState = ClubResultsState(
  matches: [],
);
