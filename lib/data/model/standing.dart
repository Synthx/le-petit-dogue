import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'standing.freezed.dart';

part 'standing.g.dart';

@freezed
class Standing with _$Standing {
  const factory Standing({
    required int draw,
    required int goalDifference,
    required int goalsAgainst,
    required int goalsFor,
    required int lost,
    required int playedGames,
    required int points,
    required int position,
    required Team team,
    required int won,
  }) = _Standing;

  factory Standing.fromJson(Map<String, dynamic> json) =>
      _$StandingFromJson(json);
}
