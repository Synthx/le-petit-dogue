import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'results_state.freezed.dart';

@freezed
class ResultsState with _$ResultsState {
  const factory ResultsState({
    required List<Match> matches,
  }) = _ResultsState;
}

const initialResultsState = ResultsState(
  matches: [],
);
