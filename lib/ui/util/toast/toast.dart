import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/colors.dart';

// ignore: camel_case_types
enum TOAST_TYPE { success, error, msg }

class ToastMessage {
  static void show(
    String text,
    TOAST_TYPE type, {
    dynamic toastLength = Toast.LENGTH_LONG,
  }) {
    Color? color;
    Color? textColor;
    if (type == TOAST_TYPE.success) {
      color = AppColors.colorGreen;
      textColor = AppColors.backgroundColor;
    }

    if (type == TOAST_TYPE.error) {
      color = AppColors.colorRed;
      textColor = AppColors.colorWhite;
    }

    Fluttertoast.showToast(
      msg: text,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
