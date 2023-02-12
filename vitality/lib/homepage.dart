import 'constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'utils/appbar.dart';

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
      drawer: Drawer(backgroundColor: AppColors.blue),
    );
  }
}
