import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/data/data.dart';
import 'package:xml/xml.dart';

class NewsService {
  Future<List<News>> findAll() async {
    final response = await http.get(
      'https://dwh.lequipe.fr/api/edito/rss?path=/Football/Lille/',
    );

    final document = XmlDocument.parse(response.data.toString());
    final rssNode = document.findElements('rss').first;
    final channelNode = rssNode.findElements('channel').first;
    final itemsNode = channelNode.findElements('item');

    return itemsNode.map((e) => News.from(e)).take(6).toList(growable: false);
  }
}
