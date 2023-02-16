import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Vitality/screens/gender.dart';
import 'package:Vitality/screens/login.dart';
import 'package:Vitality/screens/signup.dart';
import 'package:Vitality/screens/splash.dart';
import 'screens/measures.dart';
import 'screens/bmi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Vitality());
}

class Vitality extends StatelessWidget {
  const Vitality({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var routes = {
      '/': (context) => const login(),
      '/gender': (context) => const gender(),
      '/signup': (context) => const signup(),
      '/login': (context) => const login(),
      '/splash': (context) => const splash(),
      '/measures': (context) => const measures(),
      '/bmi': (context) => bmi(
            bmiResult: 0.0,
          )
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
