import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';

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