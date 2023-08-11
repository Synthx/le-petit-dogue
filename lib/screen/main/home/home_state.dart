import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    required List<Match> nextMatches,
    required List<Match> lastMatches,
    required List<News> news,
    required List<Standing> standings,
  }) = _HomeState;

  Standing get featuredTeamStanding {
    return standings.firstWhere((e) => e.team.id == kTeamId);
  }
}

const initialHomeState = HomeState(
  nextMatches: [],
  lastMatches: [],
  news: [],
  standings: [],
);
