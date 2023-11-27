import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'firebase_options.dart';
import 'spalsh_screen.dart';
import 'home.dart';
import 'onboarding_screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      home: SplashScreenDecision(),
    );
  }
}

class SplashScreenDecision extends StatefulWidget {
  @override
  _SplashScreenDecisionState createState() => _SplashScreenDecisionState();
}

class _SplashScreenDecisionState extends State<SplashScreenDecision> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  void navigateUser() async {
    bool isFirstTime = await checkFirstTime();

    // Simulate a delay, such as fetching remote configurations or data.
    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        if (isFirstTime) {
          return OnboardingScreen1();
        } else {
          return LoginPage();
        }
      },
    ));
  }

  Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      prefs.setBool('isFirstTime', false); // Set isFirstTime to false after the first launch
    }

    return isFirstTime;
  }

  @override
  Widget build(BuildContext context) {
    return FirstSplashScreen();
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/register':
      return MaterialPageRoute(builder: (_) => SignupPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginPage());
    default:
      return MaterialPageRoute(builder: (_) => LoginPage());
  }
}
