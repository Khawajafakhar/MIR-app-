import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/util/validation/validaton_utils.dart';
import '../../models/user/user.dart';
import '../sharedpreferences/constants/prefs_const.dart';


class SharedPreferenceHelper {
  final SharedPreferences _prefs;

  SharedPreferenceHelper(this._prefs);

  Future saveUser(String key, User user) async {
    return await _prefs.setString(key, jsonEncode(user));
  }

  Future saveAuthToken(String key, String value) {
    return _prefs.setString(key, value);
  }

  Future removeUser(){
    return _prefs.remove(PrefsConst.user);
  }

  Future removeAuthToken(){
    return _prefs.remove(PrefsConst.userAuthToken);
  }

  String? getAuthToken() {
    return _prefs.getString(PrefsConst.userAuthToken);
  }

  User? getUser() {
    String? prefsData = _prefs.getString(PrefsConst.user);
    if (ValidationUtils.isValid(prefsData)) {
      return User.fromJson(jsonDecode(prefsData!));
    } else {
      return null;
    }
  }
}
