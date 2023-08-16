import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/screen/screen.dart';
import 'package:jet_dogue/store/store.dart';
import 'package:jet_dogue/theme/theme.dart';

class LePetitDogue extends StatelessWidget {
  const LePetitDogue({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataStore(
            matchService: getIt(),
            standingService: getIt(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Le Petit Dogue',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: themeData,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: router,
      ),
    );
  }
}
