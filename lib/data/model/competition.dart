import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition.freezed.dart';

part 'competition.g.dart';

@freezed
class Competition with _$Competition {
  const factory Competition({
    required int id,
    required String name,
    required String code,
    required String emblem,
  }) = _Competition;

  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);
}
