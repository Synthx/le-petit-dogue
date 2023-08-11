import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/store/store.dart';

class SplashStore extends Cubit<bool> {
  final DataStore dataStore;

  SplashStore({
    required this.dataStore,
  }) : super(false);

  Future init() async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      dataStore.init(),
    ]);

    emit(true);
  }
}
