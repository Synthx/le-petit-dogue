import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

class StandingService {
  Future<List<Standing>> findAll() async {
    final snapshot = await db.collection('standings').orderBy('position').get();

    return snapshot.docs
        .map((e) => Standing.fromJson(e.data()))
        .toList(growable: false);
  }
}
