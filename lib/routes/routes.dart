import 'package:flutter/material.dart';

import '../ui/screens/authentication/signin.dart';
import '../ui/screens/authentication/signup.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/authentication/forgot_password.dart';

class Routes {
  Routes._();

  static const String signIn = "/signin";
  static const String signUp = "/signup";
  static const String home = "/home";
  static const String forgotPassword = "/forgotPassword";

  static MaterialPageRoute generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case signIn:
        return generateRoute(routeSettings.name!, SigninScreen());
      case signUp:
        return generateRoute(routeSettings.name!, SignUpScreen());
      case home:
        return generateRoute(routeSettings.name!, const HomeScreen());
      case forgotPassword:
        return generateRoute(routeSettings.name!, ForgotPasswordScreen());
      default:
        return generateRoute(
          routeSettings.name!,
          Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
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
