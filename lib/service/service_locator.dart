import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/sharedpreferences/shared_prefs_helper.dart';

final locator = GetIt.I;

Future<void> setupLocator() async {
  locator.registerSingleton<SharedPreferences>(
      (await SharedPreferences.getInstance()));

  locator.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(GetIt.I.get<SharedPreferences>()));
}
