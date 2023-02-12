import 'constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'utils/appbar.dart';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("Signup"),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[Container()],
      )),
    );
  }
}
