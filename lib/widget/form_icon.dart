import 'package:flutter/material.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';

class FormIcon extends StatelessWidget {
  final Match match;

  const FormIcon({
    required this.match,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final result = match.result(kTeamId);

    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: _getBackgroundColor(result),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          context.t.result(result.name).substring(0, 1).toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(Result result) {
    switch (result) {
      case Result.won:
        return const Color(0xFF00a83f);
      case Result.draw:
        return const Color(0xFFf3a000);
      case Result.lost:
        return const Color(0xFFdc0000);
      case Result.unknown:
        return const Color(0xFFc8cdcd);
    }
  }
}
