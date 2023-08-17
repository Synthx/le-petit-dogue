import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

part 'person.freezed.dart';

part 'person.g.dart';

@freezed
class Person with _$Person implements Comparable<Person> {
  const Person._();

  const factory Person({
    required int id,
    required String name,
    required PersonPosition position,
    required String nationality,
    @TimestampConverter() required DateTime dateOfBirth,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  @override
  int compareTo(Person other) {
    return position.order.compareTo(other.position.order);
  }
}
