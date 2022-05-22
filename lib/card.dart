import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            height: 150,
            width: 100,
          )
    );
  }
}