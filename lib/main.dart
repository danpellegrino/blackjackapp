import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';
import 'package:dcdg/dcdg.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

