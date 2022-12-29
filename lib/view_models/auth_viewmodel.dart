import 'package:flutter/material.dart';

import '../core/sharedpreferences/shared_prefs_helper.dart';
import '../core/network/api/api_service.dart';
import '../models/user/user.dart';
import '../core/network/app_urls.dart';
import '../core/network/api/api_models.dart';
import '../routes/routes.dart';
import '../constants/app_constants.dart';
import '../ui/util/toast/toast.dart';
import '../models/auth/forgotpassword_model.dart';
import '../core/sharedpreferences/constants/prefs_const.dart';
import '../service/service_locator.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;

  bool get getLoading => _loading;

  set setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //login method to call api
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading = true;
    NavigatorState navigate = Navigator.of(context);
    User? user = await ApiService.callPostApi(
      url: ApiUrls.signIn,
      params: {
        "email": email,
        "password": password,
      },
      modelName: ApiModels.userModel,
    );
    if (user != null) {
      ToastMessage.show(
        AppConstants.textSuccessLogin,
        TOAST_TYPE.success,
      );
      locator<SharedPreferenceHelper>().saveUser(
        user,
      );
      locator<SharedPreferenceHelper>().saveAuthToken(
        user.apiToken,
      );
      navigate.pushReplacementNamed(Routes.home);
      setLoading = false;
    } else {
      debugPrint(null);
      setLoading = false;
    }
  }

  //register method to call api
  Future<void> register({
    required String email,
    required String name,
    required dynamic phone,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    setLoading = true;
    NavigatorState navigate = Navigator.of(context);
    User? user = await ApiService.callPostApi(
      url: ApiUrls.signUp,
      params: {
        "user[email]": email,
        "user[first_name]": name,
        "user[last_name]": "",
        "user[phone]": phone,
        "user[password]": password,
        "user[password_confirmation]": confirmPassword,
      },
      modelName: ApiModels.userModel,
    );
    if (user != null) {
      ToastMessage.show(
        AppConstants.textSuccessRegistered,
        TOAST_TYPE.success,
      );
      locator<SharedPreferenceHelper>().saveUser(
        user,
      );
      locator<SharedPreferenceHelper>().saveAuthToken(
        user.apiToken,
      );
      navigate.pushNamedAndRemoveUntil(
        Routes.home,
        (route) => false,
      );
      setLoading = false;
    } else {
      debugPrint(null);
      setLoading = false;
    }
  }

  //forgot password method to call api
  Future<void> forgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    setLoading = true;
    NavigatorState navigate = Navigator.of(context);
    ForgotPasswordResponse? response = await ApiService.callPutApi(
        url: ApiUrls.forgotPassword,
        modelName: ApiModels.forgotPasswordModel,
        params: {
          "email": email,
        });
    if (response != null) {
      ToastMessage.show(response.success, TOAST_TYPE.success);
      navigate.pushReplacementNamed(Routes.signIn);
      setLoading = false;
    } else {
      debugPrint(null);
      setLoading = false;
    }
  }

  void logout(BuildContext context) {
    setLoading = true;
    locator<SharedPreferenceHelper>().removeUser();
    locator<SharedPreferenceHelper>().removeAuthToken();
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.signIn,
      (route) => false,
    );
    setLoading = false;
  }
}
