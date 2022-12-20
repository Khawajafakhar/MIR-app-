import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants/app_constants.dart';
import './ui/screens/authentication/signin.dart';
import './constants/app_theme.dart';
import './constants/colors.dart';
import './routes/routes.dart';
import './view_models/auth_viewmodel.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        )
      ],
      child: MaterialApp(
        title: AppConstants.textAppTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        onGenerateRoute: Routes.generateRoutes,
        home:  SigninScreen(),
      ),
    );
  }
}
