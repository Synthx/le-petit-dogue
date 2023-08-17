import 'package:flutter/material.dart';
import 'package:jet_dogue/data/data.dart';

class PersonPicture extends StatelessWidget {
  final Person person;

  const PersonPicture({
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/squads/${person.id}.png',
      fit: BoxFit.contain,
      semanticLabel: person.name,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/teams/$kTeamId.png',
          fit: BoxFit.contain,
        );
      },
    );
  }
}
