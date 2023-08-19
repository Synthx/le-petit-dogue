import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'club_squad_state.freezed.dart';

@freezed
class ClubSquadState with _$ClubSquadState {
  const factory ClubSquadState({
    required bool loading,
    required List<Person> players,
  }) = _ClubSquadState;
}

const initialClubSquadState = ClubSquadState(
  loading: false,
  players: [],
);
