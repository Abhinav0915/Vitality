import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitality/screens/gender.dart';
import 'package:vitality/screens/login.dart';
import 'package:vitality/screens/signup.dart';
import 'package:vitality/screens/splash.dart';

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
      '/': (context) => login(),
      '/gender': (context) => gender(),
      '/signup': (context) => signup(),
      '/login': (context) => login(),
      '/splash': (context) => splash()
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
