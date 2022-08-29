
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



String baseUrl = "https://google-translate1.p.rapidapi.com/language/translate/v2";
String apiKey = "e79871596emshb0313a9c7a8f5bbp146789jsn2acab48ef4df";

Future<http.Response> fetchLanguage() async {
  final response = await http.get(
    Uri.parse(
      "https://google-translate1.p.rapidapi.com/language/translate/v2/languages?target=en",
    ),
    headers: {
      "Accept-Encoding": "application/gzip",
      "X-RapidAPI-Key": apiKey,
      "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
    },
  );
  debugPrint("/languages =>${response.statusCode}");
  debugPrint("/languages =>${response.body}");
  return response;
}

