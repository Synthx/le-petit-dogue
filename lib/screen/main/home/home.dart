import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';

import 'home_header.dart';
import 'home_news.dart';
import 'home_next_matches.dart';
import 'home_standing.dart';
import 'home_store.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStore(
        dataStore: context.read(),
        newsService: getIt(),
      )..init(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: context.topSafeArea + kSafeArea,
            bottom: context.bottomSafeArea + kSafeArea,
          ),
          physics: const BouncingScrollPhysics(),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              SizedBox(height: 20),
              HomeNextMatches(),
              SizedBox(height: 50),
              HomeStanding(),
              SizedBox(height: 50),
              HomeNews(),
            ],
          ),
        ),
      ),
    );
  }
}
