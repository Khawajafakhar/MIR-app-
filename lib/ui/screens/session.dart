import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../providers/session_provider.dart';
import '../screens/authentication/signin.dart';
import '../screens/home/home_screen.dart';
import '../widgets/loading_widget.dart';

class SessionWidget extends StatelessWidget {
  const SessionWidget({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SessionProvider.checkSession(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        } else {
          return Builder(
            builder: (_) {
              FlutterNativeSplash.remove();
              switch (snapshot.data) {
                case LoginStatus.hasLoggedIn:
                  return const HomeScreen();
                case LoginStatus.hasNotLoggedIn:
                  return SigninScreen();
                default:
                  return SigninScreen();
              }
            },
          );
        }
      },
    );
  }
}
