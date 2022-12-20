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
      modelName: Apimodels.userModel,
    );
    setLoading = false;
    if (user != null) {
      ToastMessage.show(AppConstants.textLoggedIn, TOAST_TYPE.success);
      navigate.pushReplacementNamed(Routes.home);
    } else {
      debugPrint(null);
    }
  }

  //register method
 // Future<void> register({}){}

}
