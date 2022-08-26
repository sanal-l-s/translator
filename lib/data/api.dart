import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translator/models/LanguagesModel.dart';

/*
var url = "https://google-translate1.p.rapidapi.com/language/translate/v2";
var _headers = {
  'Accept-Encoding': 'application/gzip',
  'X-RapidAPI-Key': 'ff65f8810dmshbc3924987e74e13p1dc4d3jsn2178253f0f14',
  'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
};
*/

Future<Languages> fetchLanguage() async {
  final _response = await http.get(
    Uri.parse(
      "https://google-translate1.p.rapidapi.com/language/translate/v2/languages?target=en",
    ),
    headers: {
      "Accept-Encoding": "application/gzip",
      "X-RapidAPI-Key": "e79871596emshb0313a9c7a8f5bbp146789jsn2acab48ef4df",
      "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
    },
  );
  final _jsonResponse = jsonDecode(_response.body) as Map<String,dynamic>;
  // final _data = languagesFromJson(_jsonResponse["data"]);
  final _data = Languages.fromJson(_jsonResponse["data"]);
  return _data;
}

Future<void> translate() async {
  final _response = await http.post(
    Uri.parse(
      "https://google-translate1.p.rapidapi.com/language/translate/v2",
    ),
    headers: {
      "content-type": "application/x-www-form-urlencoded",
      "Accept-Encoding": "application/gzip",
      "X-RapidAPI-Key": "e79871596emshb0313a9c7a8f5bbp146789jsn2acab48ef4df",
      "X-RapidAPI-Host": "google-translate1.p.rapidapi.com"
    },
    body: {
      "q": "Hello, world!",
      "target": "es",
      "source": "en",
    },
  );
  print(_response.body);
}
