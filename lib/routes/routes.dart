import 'package:flutter/material.dart';

import '../ui/screens/authentication/signin.dart';
import '../ui/screens/authentication/signup.dart';

class Routes {
  static const String signIn = "/signin";
  static const String signUp = "/signup";

  static MaterialPageRoute generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case signIn:
        return generateRoute(routeSettings.name!, SigninScreen());
      case signUp:
        return generateRoute(routeSettings.name!,  SignUpScreen());
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
