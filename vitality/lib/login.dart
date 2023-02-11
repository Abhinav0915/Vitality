import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.black,
        backgroundColor: AppColors.blue,
        centerTitle: true,
        title: const Text("Login To Vitality"),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                height: 250,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
