import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';
import 'package:vitality/homepage.dart';
import 'utils/appbar.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("Login"),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                height: 250,
                width: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Username",
                    ),
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Password",
                    ),
                  )),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                width: 200.0,
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: AppColors.blue,
                    onPrimary: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homepage()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Container(
                  child: const Text("New User?"),
                  padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
