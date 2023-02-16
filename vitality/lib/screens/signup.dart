import 'package:firebase_auth/firebase_auth.dart';

import '../constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../utils/appbar.dart';

bool _obscureText = true;

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _hasInput3 = false;
  bool _hasInput4 = false;
  bool _hasInput5 = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onTextChanged5);
    _emailTextController.addListener(_onTextChanged3);
    _passwordTextController.addListener(_onTextChanged4);
  }

  void _onTextChanged3() {
    setState(() {
      _hasInput3 = _emailTextController.text.trim().isNotEmpty;
    });
  }

  void _onTextChanged4() {
    setState(() {
      _hasInput4 = _passwordTextController.text.trim().isNotEmpty;
    });
  }

  void _onTextChanged5() {
    setState(() {
      _hasInput5 = _nameController.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("Sign Up"),
      resizeToAvoidBottomInset: true,
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
                    textInputAction: TextInputAction.next,
                    controller: _nameController,
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    border: UnderlineInputBorder(),
                    labelText: "Enter Email ID",
                  ),
                ),
              ),
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
                    textInputAction: TextInputAction.done,
                    controller: _passwordTextController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Password",
                    ),
                  )),
            ),
            //Spacing between Containers
            const SizedBox(
              height: 30.0,
            ),
            //Button Container
            Center(
              child: Container(
                width: 200.0,
                padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: AppColors.purple,
                    onPrimary: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: _hasInput3 && _hasInput4 && _hasInput5
                      ? () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((value) {
                            print("User Created");
                            Navigator.pushNamed(context, '/splash');
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        }
                      : null,
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
            //Text Container
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
                      style: TextStyle(color: AppColors.purple),
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
