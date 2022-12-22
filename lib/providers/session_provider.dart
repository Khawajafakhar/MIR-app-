
import '../core/sharedpreferences/shared_prefs_helper.dart';
import '../service/service_locator.dart';
import '../ui/util/validation/validaton_utils.dart';

enum LoginStatus {hasLoggedIn, hasNotLoggedIn}

class SessionProvider {

 static LoginStatus loginStatus =LoginStatus.hasNotLoggedIn;

  static Future<Object?>? hasLoggedIn(){
    if(ValidationUtils.isValid(locator<SharedPreferenceHelper>().getAuthToken())){
      loginStatus = LoginStatus.hasLoggedIn;
      return Future.value(loginStatus);
    }else{
      loginStatus = LoginStatus.hasNotLoggedIn;
      return Future.value(loginStatus);
    }
  }
}