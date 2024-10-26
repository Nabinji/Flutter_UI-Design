// To parse this JSON data, do
//
//     final randomMeme = randomMemeFromJson(jsonString);

import 'dart:convert';

RandomMeme randomMemeFromJson(String str) =>
    RandomMeme.fromJson(json.decode(str));

String randomMemeToJson(RandomMeme data) => json.encode(data.toJson());

class RandomMeme {
  String description;
  String url;
  String type;
  int width;
  int height;
  double ratio;

  RandomMeme({
    required this.description,
    required this.url,
    required this.type,
    required this.width,
    required this.height,
    required this.ratio,
  });

  factory RandomMeme.fromJson(Map<String, dynamic> json) => RandomMeme(
        description: json["description"],
        url: json["url"],
        type: json["type"],
        width: json["width"],
        height: json["height"],
        ratio: json["ratio"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "url": url,
        "type": type,
        "width": width,
        "height": height,
        "ratio": ratio,
      };
}
