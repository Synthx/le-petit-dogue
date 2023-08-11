import 'package:flutter_bloc/flutter_bloc.dart';

import 'squad_state.dart';

class SquadStore extends Cubit<SquadState> {
  SquadStore() : super(initialSquadState);

  Future init() async {
    emit(state.copyWith(loading: true));
  }
}
