import 'package:freezed_annotation/freezed_annotation.dart';

enum PersonPosition {
  @JsonValue('GOALKEEPER')
  goalkeeper(0),
  @JsonValue('DEFENCE')
  defence(1),
  @JsonValue('MIDFIELD')
  midfield(2),
  @JsonValue('OFFENCE')
  offence(3),
  @JsonValue('COACH')
  coach(10);

  const PersonPosition(this.order);

  final int order;
}
