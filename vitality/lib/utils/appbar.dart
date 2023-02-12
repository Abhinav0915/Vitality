import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';

class Appbar {
  static AppBar getAppBar(String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: AppColors.black,
      backgroundColor: AppColors.purple,
      centerTitle: true,
      title: Text(title),
    );
  }
}
