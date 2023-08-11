import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    required this.news,
    super.key,
  });

  Future openNews() async {
    final uri = Uri.parse(news.link);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: news.enclosureUrl,
      imageBuilder: (context, provider) {
        return GestureDetector(
          onTap: () => openNews(),
          child: Container(
            decoration: BoxDecoration(
              color: context.primaryColor,
              image: DecorationImage(
                image: provider,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: context.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      DateTime.now().format(DateFormat.YEAR_NUM_MONTH_DAY),
                      textAlign: TextAlign.right,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: Theme.of(context).colorScheme.background,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.only(
                      right: 25,
                    ),
                    child: Text(
                      news.title,
                      style: context.textTheme.bodySmall?.copyWith(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
