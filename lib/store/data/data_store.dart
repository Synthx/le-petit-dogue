import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';

import 'data_state.dart';

class DataStore extends Cubit<DataState> {
  final MatchService matchService;
  final StandingService standingService;

  DataStore({
    required this.matchService,
    required this.standingService,
  }) : super(initialDataState);

  Future init() async {
    final [matches, standings] = await Future.wait([
      matchService.findAll(),
      standingService.findAll(),
    ]);
    (standings as List<Standing>).sort((a, b) => b.compareTo(a));

    emit(state.copyWith(
      matches: matches as List<Match>,
      standings: standings,
    ));
  }
}
