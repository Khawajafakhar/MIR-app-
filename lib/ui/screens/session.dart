import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../providers/session_provider.dart';
import 'authentication/signin_screen.dart';
import '../screens/home/home_screen.dart';
import '../widgets/loading_widget.dart';

class SessionWidget extends StatelessWidget {
  const SessionWidget({
    Key? key,
  }) : super(key: key);

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
                  return HomeScreen();
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
