import 'package:get_it/get_it.dart';
import 'package:jet_dogue/data/data.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton(() => MatchService());
  getIt.registerLazySingleton(() => NewsService());
  getIt.registerLazySingleton(() => StandingService());
  getIt.registerLazySingleton(() => SquadService());
}
