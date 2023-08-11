import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'squad_state.freezed.dart';

@freezed
class SquadState with _$SquadState {
  const factory SquadState({
    required bool loading,
    required List<Person> persons,
    required Map<String, List<Person>> displayedPersons,
  }) = _SquadState;
}

const initialSquadState = SquadState(
  loading: false,
  persons: [],
  displayedPersons: {},
);
