import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';
import 'package:vitality/screens/bmi.dart';
import 'package:vitality/screens/gender.dart';
import '/utils/appbar.dart';

class measures extends StatefulWidget {
  const measures({Key? key}) : super(key: key);

  @override
  State<measures> createState() => _measuresState();
}

class _measuresState extends State<measures> {
  double _heightValue = 0.0;

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  int age = 0;
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: Appbar.getAppBar("Enter Your Measures"),
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
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Set Your height (cm)",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Slider(
                        thumbColor: AppColors.purple,
                        activeColor: Colors.red,
                        value: _heightValue,
                        min: 0.0,
                        max: 200.0,
                        divisions: 200,
                        inactiveColor: Colors.grey,
                        label: '$_heightValue',
                        onChanged: (newValue) {
                          setState(() {
                            _heightValue = newValue.round().toDouble();
                          });
                        },
                      ),
                      Text(
                        'Height: $_heightValue cm',
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.grey),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1.0, 2.0),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  height: 150.0,
                  width: 370.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                          child: Text(
                        "Enter Your Age",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      TextField(
                        controller: _ageController,
                        onChanged: (value) {
                          final int parsedValue = int.tryParse(value) ?? age;
                          setState(() {
                            age = parsedValue;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your age',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          contentPadding: EdgeInsets.only(left: 16.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                                _ageController.text = age.toString();
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 40.0,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                                _ageController.text = age.toString();
                              });
                            },
                            icon: Icon(Icons.remove,
                                size: 40.0, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1.0, 2.0),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              height: 150.0,
              width: 370.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    "Enter Your Weight (Kg)",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  TextField(
                    controller: _weightController,
                    onChanged: (value) {
                      final int parsedValue = int.tryParse(value) ?? age;
                      setState(() {
                        weight = parsedValue;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your weight (kg)',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      contentPadding: EdgeInsets.only(left: 16.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            weight++;
                            _weightController.text = weight.toString();
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 40.0,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            weight--;
                            _weightController.text = weight.toString();
                          });
                        },
                        icon: const Icon(Icons.remove,
                            size: 40.0, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 180.0,
              margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
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
                  double bmiResult =
                      weight / ((_heightValue / 100) * (_heightValue / 100));

                  

                  if (_heightValue == 0.0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your height'),
                      ),
                    );
                  } else if (age == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your age'),
                      ),
                    );
                  } else if (weight == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter your weight'),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => bmi(
                          bmiResult: bmiResult,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Calculate BMI',
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
