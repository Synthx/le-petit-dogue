import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'data_state.freezed.dart';

@freezed
class DataState with _$DataState {
  const DataState._();

  const factory DataState({
    required List<Standing> standings,
    required List<Match> matches,
  }) = _DataState;

  List<Match> get featuredTeamMatches {
    return matches.where((e) {
      return e.home.id == kTeamId || e.away.id == kTeamId;
    }).toList();
  }
}

const initialDataState = DataState(
  standings: [],
  matches: [],
);
