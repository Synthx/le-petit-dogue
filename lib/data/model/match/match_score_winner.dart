import 'package:freezed_annotation/freezed_annotation.dart';

enum MatchScoreWinner {
  @JsonValue('HOME_TEAM')
  home,
  @JsonValue('AWAY_TEAM')
  away,
  @JsonValue('DRAW')
  draw,
}
