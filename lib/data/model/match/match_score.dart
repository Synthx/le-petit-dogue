import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/data/data.dart';

part 'match_score.freezed.dart';

part 'match_score.g.dart';

@freezed
class MatchScore with _$MatchScore {
  const factory MatchScore({
    required String duration,
    MatchScoreWinner? winner,
    required MatchScoreResult halfTime,
    required MatchScoreResult fullTime,
  }) = _MatchScore;

  factory MatchScore.fromJson(Map<String, dynamic> json) =>
      _$MatchScoreFromJson(json);
}
