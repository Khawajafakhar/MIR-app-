import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/util/validation/validaton_utils.dart';
import '../../models/user/user_model.dart';
import '../sharedpreferences/constants/prefs_const.dart';


class SharedPreferenceHelper {
  final SharedPreferences _prefs;

  SharedPreferenceHelper(this._prefs);


//Authentication preferences
  Future saveUser(User user)  {
    return  _prefs.setString(PrefsConst.user, jsonEncode(user));
  }

  Future saveAuthToken(String value) {
    return _prefs.setString(PrefsConst.userAuthToken, value);
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
