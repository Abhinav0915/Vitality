import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';
import 'package:vitality/screens/gender.dart';
import '/utils/appbar.dart';

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  double _heightValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: Appbar.getAppBar("Check Your BMI"),
      floatingActionButton: Tooltip(
        message: 'Go back',
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => gender()));
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text("Set Your height (cm)"),
                    Slider(
                      value: _heightValue,
                      min: 0.0,
                      max: 200.0,
                      divisions: 10,
                      label: '$_heightValue',
                      onChanged: (newValue) {
                        setState(() {
                          _heightValue = newValue;
                        });
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
