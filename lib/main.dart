import 'package:flutter/material.dart';
import 'package:translator/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Gilroy'
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
