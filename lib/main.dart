import 'package:flutter/material.dart';
import 'package:translator/view/homepage/homepage.dart';
import 'package:translator/view/homepage/homepage_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomepageBloc(),
      child: MaterialApp(
        title: 'Translator',
        theme: ThemeData(
            primarySwatch: Colors.grey,
            fontFamily: 'Gilroy'
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
