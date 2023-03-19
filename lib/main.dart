import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Exam 2/2565',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18.0),
          bodyText2: TextStyle(fontSize: 16.0),
          subtitle1: TextStyle(fontSize: 14.0),
        ),
      ),
      home: const HomePage(),
    );
  }
}


class Palette {
  static const MaterialColor colorTheme = MaterialColor(
    0xff063192,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff063192), //10%
      100: Color(0xff063192), //20%
      200: Color(0xff063192), //30%
      300: Color(0xff063192), //40%
      400: Color(0xff063192), //50%
      500: Color(0xff063192), //60%
      600: Color(0xff063192), //70%
      700: Color(0xff063192), //80%
      800: Color(0xff063192), //90%
      900: Color(0xff063192), //100%
    },
  );
}
