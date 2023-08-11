import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

class MatchService {
  Future<List<Match>> findAll() async {
    final snapshot = await db.collection('matches').orderBy('date').get();

    return snapshot.docs
        .map((e) => Match.fromJson(e.data()))
        .toList(growable: false);
  }
}
