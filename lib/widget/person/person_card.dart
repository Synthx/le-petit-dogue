import 'package:flutter/material.dart';
import 'package:jet_dogue/data/data.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'data',
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Text(
            person.name,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
