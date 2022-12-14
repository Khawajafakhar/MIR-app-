import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants/app_strings.dart';
import './ui/screens/authentication/signin.dart';
import './constants/app_theme.dart';
import './constants/colors.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.backgroundColor, // navigation bar color
    statusBarColor: AppColors.backgroundColor, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.textAppTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home:const SigninScreen(),
    );
  }
}
