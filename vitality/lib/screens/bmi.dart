import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';
import '/utils/appbar.dart';
import 'package:vitality/screens/measures.dart';

class bmi extends StatefulWidget {
  final double bmiResult;

  const bmi({Key? key, required this.bmiResult}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("Results"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(25, 40, 20, 0),
            child: Text(
              "BMI Results are here ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 40, 45, 0),
            height: 400,
            width: 330,
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.black,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                "${widget.bmiResult.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
        ],
      )),
    );
  }
}




// Text(
//         "Your BMI is: ${widget.bmiResult}",
//         style: TextStyle(fontSize: 20.0),