import 'package:flutter/material.dart';

import '../core/network/api/api_service.dart';
import '../models/user/user.dart';
import '../core/network/app_urls.dart';
import '../core/network/api/api_models.dart';
import '../routes/routes.dart';
import '../constants/app_constants.dart';
import '../ui/util/toast/toast.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;

  bool get getLoading => _loading;

  set setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //login method
  Future<void> login({
    required String email,
    required String password,
    required NavigatorState navigate,
  }) async {
    setLoading = true;
    User? user = await ApiService.callPostApi(
      url: AppUrls.signIn,
      params: {
        "email": email,
        "password": password,
      },
      modelName: ApiModels.userModel,
    );
    setLoading = false;
    if (user != null) {
      ToastMessage.show(AppConstants.textSuccessLogin, TOAST_TYPE.success);
      navigate.pushReplacementNamed(Routes.home);
    } else {
      debugPrint(null);
    }
  }

  //register method
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
      url: AppUrls.signUp,
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
    setLoading = false;
    if (user != null) {
      ToastMessage.show(AppConstants.textSuccessRegistered, TOAST_TYPE.success);
      navigate.pushReplacementNamed(Routes.home);
    } else {
      debugPrint(null);
    }
  }
}
