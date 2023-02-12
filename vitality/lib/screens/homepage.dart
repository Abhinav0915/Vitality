import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vitality/screens/login.dart';
import '/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '/utils/appbar.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("Vitality"),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: const Text("Log Out"),
            onTap: () {},
          )
        ],
      )),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              primary: AppColors.purple,
              onPrimary: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => login())));
            },
            child: const Text(
              'Log Out',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
