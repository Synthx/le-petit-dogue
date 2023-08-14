import 'package:cloud_firestore/cloud_firestore.dart';

class ParseDocumentsArg<T> {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final T Function(Map<String, dynamic>) fromJson;

  ParseDocumentsArg({
    required this.documents,
    required this.fromJson,
  });
}

List<T> parseDocuments<T>(ParseDocumentsArg<T> arg) {
  return arg.documents.map((e) => arg.fromJson(e.data())).toList();
}
