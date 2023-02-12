import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';
import 'package:vitality/screens/homepage.dart';
import '../utils/appbar.dart';

bool _obscureText = true;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  bool _hasInput1 = false;
  bool _hasInput2 = false;

  @override
  void initState() {
    super.initState();
    _emailTextController.addListener(_onTextChanged);
    _passwordTextController.addListener(_onTextChanged2);
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasInput1 = _emailTextController.text.trim().isNotEmpty;
    });
  }

  void _onTextChanged2() {
    setState(() {
      _hasInput2 = _passwordTextController.text.trim().isNotEmpty;
    });
  }

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
                    textInputAction: TextInputAction.next,
                    controller: _emailTextController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      border: UnderlineInputBorder(),
                      labelText: "Enter Email",
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
                    textInputAction: TextInputAction.done,
                    obscureText: _obscureText,
                    controller: _passwordTextController,
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
                    primary: AppColors.purple,
                    onPrimary: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: _hasInput1 && _hasInput2
                      ? () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homepage()));
                          }).catchError((error) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  elevation: 24.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  backgroundColor: AppColors.purple,
                                  title: Text("Error"),
                                  content: Text("Invalid email or password"),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        }
                      : null,
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
