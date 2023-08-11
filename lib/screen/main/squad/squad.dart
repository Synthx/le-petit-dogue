import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'squad_store.dart';

class SquadScreen extends StatelessWidget {
  const SquadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SquadStore()..init(),
      child: const Scaffold(
        body: Center(
          child: Text('SquadScreen'),
        ),
      ),
    );
  }
}
