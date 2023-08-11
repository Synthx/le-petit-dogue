import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

part 'news.freezed.dart';

@freezed
class News with _$News {
  const News._();

  const factory News({
    required String title,
    required String link,
    required String description,
    required String publicationDate,
    required String enclosureUrl,
  }) = _News;

  static News from(XmlElement element) {
    return News(
      title: element.findElements('title').first.innerText,
      link: element.findElements('link').first.innerText,
      description: element.findElements('description').first.innerText,
      publicationDate: element.findElements('pubDate').first.innerText,
      enclosureUrl:
          element.findElements('enclosure').first.getAttribute('url')!,
    );
  }
}
