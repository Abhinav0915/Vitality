import 'constants/color_constants.dart';
import 'package:flutter/material.dart';

class Appbar {
  static AppBar getAppBar(String title) {
    return AppBar(
      shadowColor: AppColors.black,
      backgroundColor: AppColors.blue,
      centerTitle: true,
      title: Text(title),
    );
  }
}

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
    );
  }
}
