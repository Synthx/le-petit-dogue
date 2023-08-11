import 'package:freezed_annotation/freezed_annotation.dart';

enum MatchStatus {
  @JsonValue('SCHEDULED')
  scheduled,
  @JsonValue('TIMED')
  timed,
  @JsonValue('IN_PLAY')
  inPlay,
  @JsonValue('PAUSED')
  paused,
  @JsonValue('FINISHED')
  finished,
  @JsonValue('SUSPENDED')
  suspended,
  @JsonValue('POSTPONED')
  postponed,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('AWARDED')
  awarded;
}
