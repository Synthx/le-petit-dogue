import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:jet_dogue/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_section.dart';
import 'home_store.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  Future openNews() async {
    final uri = Uri.parse('https://www.lequipe.fr/Football/Lille/');
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeStore, HomeState, List<News>>(
      selector: (state) => state.news,
      builder: (context, news) {
        return HomeSection(
          onMore: () => openNews(),
          title: context.t.news,
          child: SizedBox(
            height: 220,
            child: ListView.separated(
              itemCount: news.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: kSafeArea,
              ),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: kSpacer,
                );
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 300,
                  child: NewsCard(
                    news: news[index],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
