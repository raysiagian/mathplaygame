import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'onboarding_screen1.dart';

class FirstSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstSplashScreenState();
}

class FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDestination);
  }

  navigateToDestination() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreenDecision()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF13877E),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset(
                'img/app_logo.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondSplashScreenState();
}

class SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToOnboarding);
  }

  navigateToOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF13877E),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset(
                'img/app_logo_text.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
