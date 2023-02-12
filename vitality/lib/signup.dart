import 'package:firebase_auth/firebase_auth.dart';

import 'constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'utils/appbar.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
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
            //Logo Container
            Container(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                height: 250,
                width: 200,
              ),
            ),
            //Name Container
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Name",
                    ),
                  )),
            ),
            //Spacing between Containers
            const SizedBox(
              height: 10.0,
            ),
            //Email Container
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _emailTextController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Email ID",
                    ),
                  )),
            ),
            //Spacing between Containers
            const SizedBox(
              height: 10.0,
            ),
            //Password Container
            Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _passwordTextController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Password",
                    ),
                  )),
            ),
            //Spacing between Containers
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
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("User Created");
                      Navigator.pushNamed(context, '/homepage');
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  child: const Text(
                    'Sign Up',
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
            Center(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: const Text("Alredy Registered?"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "login",
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
