import 'package:flutter/material.dart';
import 'package:vitality/homepage.dart';
import 'package:vitality/login.dart';
import 'package:vitality/signup.dart';

void main() {
  runApp(const Vitality());
}

class Vitality extends StatelessWidget {
  const Vitality({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const login(),
        '/homepage': (context) => const homepage(),
        '/signup' : ((context) =>  const signup()),
      },
    );
  }
}
