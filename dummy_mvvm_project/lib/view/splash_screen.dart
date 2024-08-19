import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dummy_mvvm_project/utilities/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteName.login);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                  animation: _animationController,
                  child: Container(
                      height: 200,
                      width: 200,
                      child: const Center(
                        child: Image(image: AssetImage("images/virus.png")),
                      )),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _animationController.value * 2.0 * pi,
                      child: child,
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const Text(
                "Covid 19 \n Tracker App",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ]),
      )),
    );
  }
}
