import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Vitality/screens/measures.dart';
import 'package:Vitality/screens/login.dart';
import '/constants/color_constants.dart';
import 'package:flutter/material.dart';
import '/utils/appbar.dart';

class gender extends StatefulWidget {
  const gender({Key? key}) : super(key: key);

  @override
  State<gender> createState() => _genderState();
}

class _genderState extends State<gender> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void selectMale() {
    setState(() { 
      isMaleSelected = true;
      isFemaleSelected = false;
    });
  }

  void selectFemale() {
    setState(() {
      isMaleSelected = false;
      isFemaleSelected = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.getAppBar("Vitality"),
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: selectMale,
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/male.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25.0),
                      color:
                          isMaleSelected ? Colors.lightBlue : AppColors.black,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1.0, 2.0),
                          blurRadius: 10.0,
                        )
                      ]),
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  height: 150.0,
                  width: 150.0,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: selectFemale,
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/female.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25.0),
                      color:
                          isFemaleSelected ? Colors.lightBlue : AppColors.black,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1.0, 2.0),
                          blurRadius: 10.0,
                        )
                      ]),
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  height: 150.0,
                  width: 150.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(80, 50, 0, 0),
                child: const Text(
                  "Select Your Gender",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 180.0,
                margin: EdgeInsets.fromLTRB(110, 50, 0, 0),
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
                    if (isMaleSelected || isFemaleSelected) {
                      // Navigate to next screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => measures()));
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}


// body: Center(
//         child: Column(children: <Widget> [
          
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               alignment: Alignment.center,
//               primary: AppColors.purple,
//               onPrimary: AppColors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//             ),
//             onPressed: () {
//               FirebaseAuth.instance.signOut().then((value) => Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => login())));
//             },
//             child: const Text(
//               'Log Out',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ]),
//       ),