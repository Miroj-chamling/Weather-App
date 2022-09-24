import 'package:flutter/material.dart';
import 'package:weather_app/homescree.dart';
import 'package:weather_app/theme.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: HomeScreen(),
    );
  }
}
