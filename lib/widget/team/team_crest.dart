import 'package:flutter/material.dart';
import 'package:jet_dogue/data/data.dart';

class TeamCrest extends StatelessWidget {
  final Team team;
  final double size;

  const TeamCrest({
    required this.team,
    this.size = 60,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/teams/${team.id}.png'),
      height: size,
      width: size,
      fit: BoxFit.contain,
      semanticLabel: team.name,
    );
  }
}
