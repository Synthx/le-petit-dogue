import 'package:flutter/foundation.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

class MatchService {
  Future<List<Match>> findAll() async {
    final snapshot = await db.collection('matches').orderBy('date').get();

    return compute(
      parseDocuments,
      ParseDocumentsArg(
        documents: snapshot.docs,
        fromJson: Match.fromJson,
      ),
    );
  }
}
