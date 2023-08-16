import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

void setupFirebase() {
  db.settings = const Settings(
    persistenceEnabled: true,
  );
}
