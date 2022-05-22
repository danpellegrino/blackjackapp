import 'package:flutter/material.dart';
import 'card.dart';

class Homepage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Center(
        child: Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCard()
          ],
        ),),
      ),
    );
  }
}