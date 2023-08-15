import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'competition_calendar_state.freezed.dart';

@freezed
class CompetitionCalendarState with _$CompetitionCalendarState {
  const factory CompetitionCalendarState({
    required Map<int, List<Match>> matches,
    required int matchDay,
  }) = _CompetitionCalendarState;
}

const initialCompetitionCalendarState = CompetitionCalendarState(
  matches: {},
  matchDay: 0,
);
