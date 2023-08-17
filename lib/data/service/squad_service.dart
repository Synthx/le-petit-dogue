import 'package:flutter/foundation.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

class SquadService {
  Future<List<Person>> findAll() async {
    final snapshot = await db.collection('squads').get();

    return compute(
      parseDocuments,
      ParseDocumentsArg(
        documents: snapshot.docs,
        fromJson: Person.fromJson,
      ),
    );
  }
}
