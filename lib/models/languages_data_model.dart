// To parse this JSON data, do
//
//     final languagesData = languagesDataFromJson(jsonString);

import 'dart:convert';

LanguagesData languagesDataFromJson(String str) => LanguagesData.fromJson(json.decode(str));

String languagesDataToJson(LanguagesData data) => json.encode(data.toJson());

class LanguagesData {
  LanguagesData({
    this.data,
  });

  Data? data;

  factory LanguagesData.fromJson(Map<String, dynamic> json) => LanguagesData(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.languages,
  });

  List<Language>? languages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
  };
}

class Language {
  Language({
    this.language,
    this.name,
  });

  String? language;
  String? name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    language: json["language"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "name": name,
  };
}
