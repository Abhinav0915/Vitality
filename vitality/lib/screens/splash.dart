import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitality/constants/color_constants.dart';
import 'package:vitality/screens/gender.dart';
import 'package:vitality/screens/gender.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://assets4.lottiefiles.com/packages/lf20_qr6rdacm.json",
              controller: _controller, onLoaded: (compos) {
            _controller
              ..duration = compos.duration
              ..forward().then((value) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => gender()));
              });
          }),
          Center(child: Text("Registered Successfully")),
        ],
      ),
    );
  }
}
