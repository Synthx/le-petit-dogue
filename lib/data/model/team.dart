import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';

part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required int id,
    required String name,
    required String fullName,
    required String shortName,
    required String tla,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
