import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

import './constants/app_constants.dart';
import './constants/app_theme.dart';
import './constants/colors.dart';
import './routes/routes.dart';
import './view_models/auth_viewmodel.dart';
import './service/service_locator.dart';
import './ui/screens/session.dart';
import './providers/speech_to_text_provider.dart';

late SpeechToTextProvider speechToTextProvider;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.backgroundColor, // navigation bar color
    statusBarColor: AppColors.backgroundColor, // status bar color
  ));
  SpeechToText speechToText = SpeechToText();
  speechToTextProvider = SpeechToTextProvider(speechToText);
  speechToTextProvider.initSpeechToText();
  await setupLocator();
  runApp(const MIRApp());
}

class MIRApp extends StatelessWidget {
  const MIRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider<SpeechToTextProvider>.value(
          value: speechToTextProvider,
        ),
      ],
      child: MaterialApp(
          title: AppConstants.textAppTitle,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(),
          onGenerateRoute: Routes.generateRoutes,
          home: const SessionWidget()),
    );
  }
}
