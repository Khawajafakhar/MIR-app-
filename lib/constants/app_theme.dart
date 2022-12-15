import 'package:flutter/material.dart';

import './colors.dart';
import './fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primarySwatch: MaterialColor(
          AppColors.primarySwatch[900]!.value, AppColors.primarySwatch),
      primaryColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: Fonts.fontBeVietnam,
    );
  }
}
