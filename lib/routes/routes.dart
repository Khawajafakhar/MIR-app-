import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../ui/screens/authentication/signin_screen.dart';
import '../ui/screens/authentication/signup_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/authentication/forgot_password_screen.dart';
import '../ui/screens/voice_recorder/voice_recorder_screen.dart';
import '../ui/screens/text_media/text_media_screen.dart';

class Routes {
  Routes._();

  static const String signIn = "/signin";
  static const String signUp = "/signup";
  static const String home = "/home";
  static const String forgotPassword = "/forgotPassword";
  static const String voiceRecorder = "/voiceRecorder";
  static const String textMedia = "/textMedia";

  static MaterialPageRoute generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case signIn:
        return generateRoute(routeSettings.name!, SigninScreen());
      case signUp:
        return generateRoute(routeSettings.name!, SignUpScreen());
      case home:
        return generateRoute(routeSettings.name!, HomeScreen());
      case forgotPassword:
        return generateRoute(routeSettings.name!, ForgotPasswordScreen());
      case voiceRecorder:
        return generateRoute(routeSettings.name!,  VoiceRecorderScreen());
        case textMedia:
        return generateRoute(routeSettings.name!, const TextMediaScreen());
      default:
        return generateRoute(
          routeSettings.name!,
          Scaffold(
            body: Center(
              child: Text(
                "${AppConstants.textNoRoute} ${routeSettings.name}",
              ),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute generateRoute(String routeName, Widget widget) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => widget,
    );
  }
}
