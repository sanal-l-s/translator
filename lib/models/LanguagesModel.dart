import 'dart:convert';

Languages languagesFromJson(String str) => Languages.fromJson(json.decode(str));

String languagesToJson(Languages data) => json.encode(data.toJson());

class Languages {
  Languages({
    this.languages,
  });

  List<Language>? languages;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
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
