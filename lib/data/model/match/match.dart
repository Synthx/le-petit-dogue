import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

export 'match_score.dart';
export 'match_score_result.dart';
export 'match_score_winner.dart';
export 'match_status.dart';

part 'match.freezed.dart';

part 'match.g.dart';

@freezed
class Match with _$Match {
  const Match._();

  const factory Match({
    required int matchday,
    @TimestampConverter() required DateTime date,
    required MatchStatus status,
    required Competition competition,
    required Team away,
    required Team home,
    required MatchScore score,
  }) = _Match;

  Result result(int teamId) {
    switch (score.winner) {
      case null:
        return Result.unknown;
      case MatchScoreWinner.draw:
        return Result.draw;
      case MatchScoreWinner.home:
        return teamId == home.id ? Result.won : Result.lost;
      case MatchScoreWinner.away:
        return teamId == away.id ? Result.won : Result.lost;
    }
  }

  bool get isFinished {
    return status == MatchStatus.finished;
  }

  bool get isFeatured {
    return home.id == kTeamId || away.id == kTeamId;
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}
