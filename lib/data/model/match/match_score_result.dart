import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_score_result.freezed.dart';

part 'match_score_result.g.dart';

@freezed
class MatchScoreResult with _$MatchScoreResult {
  const factory MatchScoreResult({
    int? away,
    int? home,
  }) = _MatchScoreResult;

  factory MatchScoreResult.fromJson(Map<String, dynamic> json) =>
      _$MatchScoreResultFromJson(json);
}
