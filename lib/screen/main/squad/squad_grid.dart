import 'package:flutter/material.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';

class SquadGrid extends StatelessWidget {
  final List<Person> persons;

  const SquadGrid({
    required this.persons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: persons.length,
      padding: const EdgeInsets.symmetric(
        horizontal: kSafeArea,
      ),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return PersonCard(
          person: persons[index],
        );
      },
    );
  }
}
