import 'package:flutter/material.dart';
import '../play_session/homepage.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  const SplashScreen({super.key});
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    GoRouter.of(context).go('/mainmenu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset('assets/images/main_bg.jpg',
                      fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 180,
                          height: 180,
                          color: Color.fromARGB(255, 238, 243, 233),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/main_icon.jpg',
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ),
                      Text('Blackjack',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold))
                    ]),
              )
            ])));
  }
}
