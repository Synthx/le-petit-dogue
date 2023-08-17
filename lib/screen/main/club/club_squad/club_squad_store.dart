import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/data/data.dart';

import 'club_squad_state.dart';

export 'club_squad_state.dart';

class ClubSquadStore extends Cubit<ClubSquadState> {
  final SquadService squadService;

  ClubSquadStore({
    required this.squadService,
  }) : super(initialClubSquadState);

  Future init() async {
    emit(state.copyWith(loading: true));
    final players = await squadService.findAll();
    players.sort((a, b) => a.compareTo(b));

    emit(state.copyWith(
      loading: false,
      players: players,
    ));
  }
}
