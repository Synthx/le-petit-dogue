import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'upcoming_state.freezed.dart';

@freezed
class UpcomingMatchesState with _$UpcomingMatchesState {
  const factory UpcomingMatchesState({
    required List<Match> matches,
  }) = _UpcomingMatchesState;
}

const initialUpcomingMatchesState = UpcomingMatchesState(
  matches: [],
);
