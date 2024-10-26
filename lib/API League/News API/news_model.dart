// To parse this JSON data, do
//
//     final topNews = topNewsFromJson(jsonString);

import 'dart:convert';

TopNews topNewsFromJson(String str) => TopNews.fromJson(json.decode(str));

String topNewsToJson(TopNews data) => json.encode(data.toJson());

class TopNews {
  List<TopNew> topNews;
  Language language;
  Country country;

  TopNews({
    required this.topNews,
    required this.language,
    required this.country,
  });

  factory TopNews.fromJson(Map<String, dynamic> json) => TopNews(
        topNews:
            List<TopNew>.from(json["top_news"].map((x) => TopNew.fromJson(x))),
        language: languageValues.map[json["language"]]!,
        country: countryValues.map[json["country"]]!,
      );

  Map<String, dynamic> toJson() => {
        "top_news": List<dynamic>.from(topNews.map((x) => x.toJson())),
        "language": languageValues.reverse[language],
        "country": countryValues.reverse[country],
      };
}

enum Country { COUNTRY_US, US }

final countryValues = EnumValues({"us": Country.COUNTRY_US, "US": Country.US});

enum Language { EN }

final languageValues = EnumValues({"en": Language.EN});

class TopNew {
  List<News> news;

  TopNew({
    required this.news,
  });

  factory TopNew.fromJson(Map<String, dynamic> json) => TopNew(
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class News {
  int id;
  String title;
  String text;
  String? summary;
  String url;
  String image;
  String? video;
  DateTime publishDate;
  List<String>? authors;
  Language language;
  Country sourceCountry;
  double sentiment;

  News({
    required this.id,
    required this.title,
    required this.text,
    this.summary,
    required this.url,
    required this.image,
    required this.video,
    required this.publishDate,
    this.authors,
    required this.language,
    required this.sourceCountry,
    required this.sentiment,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        summary: json["summary"],
        url: json["url"],
        image: json["image"],
        video: json["video"],
        publishDate: DateTime.parse(json["publish_date"]),
        authors: json["authors"] == null
            ? []
            : List<String>.from(json["authors"]!.map((x) => x)),
        language: languageValues.map[json["language"]]!,
        sourceCountry: countryValues.map[json["source_country"]]!,
        sentiment: json["sentiment"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
        "summary": summary,
        "url": url,
        "image": image,
        "video": video,
        "publish_date": publishDate.toIso8601String(),
        "authors":
            authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "language": languageValues.reverse[language],
        "source_country": countryValues.reverse[sourceCountry],
        "sentiment": sentiment,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
