import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'club_calendar_state.freezed.dart';

@freezed
class ClubCalendarState with _$ClubCalendarState {
  const factory ClubCalendarState({
    required List<Match> matches,
  }) = _ClubCalendarState;
}

const initialClubCalendarState = ClubCalendarState(
  matches: [],
);
