import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  final color;

  CardBack({this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          height: 150,
          width: 100,
          child: (color == Colors.red)
              ? Image.asset('assets/images/redcard_back.jpg')
              : Image.asset('assets/images/blackcard_back.jpg'),
        ),
      ),
    );
  }
}
