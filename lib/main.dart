import 'package:blackjackapp/providers/game_provider.dart';
import 'package:blackjackapp/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splashscreen.dart';
// ignore: unused_import
import 'package:dcdg/dcdg.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
      child: const NewApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class NewApp extends StatelessWidget {
  const NewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}
