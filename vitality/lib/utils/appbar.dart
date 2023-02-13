import 'package:flutter/material.dart';
import 'package:vitality/constants/color_constants.dart';

class Appbar {
  static AppBar getAppBar(String title) {
    return AppBar(
      // leading: Icon(Icons.back_hand),
      automaticallyImplyLeading: false,
      shadowColor: AppColors.black,
      backgroundColor: AppColors.purple,
      centerTitle: true,
      title: Text(title),
    );
  }
}
