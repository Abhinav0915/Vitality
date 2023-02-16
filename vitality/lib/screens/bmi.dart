import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Vitality/constants/color_constants.dart';
import 'package:Vitality/screens/gender.dart';
import '/utils/appbar.dart';
import '/constants/color_constants.dart';
import 'package:Vitality/screens/measures.dart';

import 'login.dart';

class bmi extends StatefulWidget {
  final double bmiResult;

  const bmi({Key? key, required this.bmiResult}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  
  String getCategory(double bmiResult) {
    if (bmiResult < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      return 'NORMAL';
    } else if (bmiResult >= 25 && bmiResult < 30) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESE';
    }
  }

  Color getColor(double bmiResult) {
    if (bmiResult < 18.5) {
      return AppColors.blue;
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      return AppColors.green;
    } else if (bmiResult >= 25 && bmiResult < 30) {
      return AppColors.yellow;
    } else {
      return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    String category = getCategory(widget.bmiResult);
    Color color = getColor(widget.bmiResult);

    return Scaffold(
      appBar: Appbar.getAppBar("Results"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 40, 20, 0),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 40, 45, 0),
              height: 400,
              width: 330,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.black,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "${widget.bmiResult.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 50.0),
                  ),
                ],
              ),
            ),
            Container(
              width: 180.0,
              margin: EdgeInsets.fromLTRB(20, 50, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  primary: AppColors.purple,
                  onPrimary: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  {
                    // Navigate to next screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => gender()));
                  }
                },
                child: const Text(
                  'Calculate Again',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 180.0,
              margin: const EdgeInsets.fromLTRB(20, 50, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  primary: AppColors.purple,
                  onPrimary: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  {
                    FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => login())));
                  }
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
