import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jet_dogue/app.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupFirebase();
  setupInjector();

  await initializeDateFormatting('fr_FR');
  Intl.defaultLocale = 'fr_FR';

  runApp(const LePetitDogue());
}
