import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/store/store.dart';

import 'home_state.dart';

export 'home_state.dart';

class HomeStore extends Cubit<HomeState> {
  final DataStore dataStore;
  final NewsService newsService;

  HomeStore({
    required this.dataStore,
    required this.newsService,
  }) : super(initialHomeState);

  Future init() async {
    final matches = dataStore.state.featuredTeamMatches;
    final nextMatches = matches.where((e) => !e.isFinished).take(2).toList();
    final lastMatches = matches.where((e) => e.isFinished).take(5).toList();
    lastMatches.sort((a, b) => b.date.compareTo(a.date));
    emit(state.copyWith(
      nextMatches: nextMatches,
      lastMatches: lastMatches,
    ));

    var standings = dataStore.state.standings;
    final teamIndex = standings.indexWhere((e) => e.team.id == kTeamId);
    if (teamIndex != -1) {
      if (teamIndex < 2) {
        standings = standings.sublist(0, 4);
      } else if (teamIndex > standings.length - 3) {
        standings = standings.sublist(standings.length - 4);
      } else {
        standings = standings.sublist(teamIndex - 2, teamIndex + 2);
      }
    } else {
      standings = [];
    }
    emit(state.copyWith(
      standings: standings,
    ));

    final news = await newsService.findAll();
    emit(state.copyWith(
      news: news,
    ));
  }
}
