import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/widget/widget.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: PersonPicture(
                person: person,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                children: [
                  Text(
                    '18',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: SizedBox(
                      height: 25,
                      child: VerticalDivider(),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person.name,
                          style: context.textTheme.bodyMedium?.copyWith(),
                        ),
                        Text(
                          context.t.personPosition(person.position.name),
                          style: context.textTheme.bodySmall?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
