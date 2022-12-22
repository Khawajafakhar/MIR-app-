import 'package:flutter/material.dart';

import '../../providers/session_provider.dart';
import '../widgets/loading_widget.dart';
import '../screens/authentication/signin.dart';
import '../screens/home/home_screen.dart';

class SessionWidget extends StatelessWidget {
  const SessionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SessionProvider.hasLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else {
            return Builder(
              builder: (context) {
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
      ),
    );
  }
}
