
import '../core/sharedpreferences/shared_prefs_helper.dart';
import '../service/service_locator.dart';
import '../ui/util/validation/validaton_utils.dart';

enum LoginStatus {hasLoggedIn, hasNotLoggedIn,}

class SessionProvider{

 static LoginStatus loginStatus =LoginStatus.hasNotLoggedIn;

 LoginStatus get getLoginStatus => loginStatus;

   static dynamic checkSession(){
    bool hasToken = ValidationUtils.isValid(locator<SharedPreferenceHelper>().getAuthToken());
    if(hasToken){
      loginStatus = LoginStatus.hasLoggedIn;
      return Future.value(loginStatus);
    }else if(!hasToken){
      loginStatus = LoginStatus.hasNotLoggedIn;
      return Future.value(loginStatus);
    }
  }
 

}