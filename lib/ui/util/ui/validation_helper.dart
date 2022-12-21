
import './../validation/validaton_utils.dart';
import '../../../constants/app_constants.dart';

class ValidationHelper {

  ValidationHelper._();
  static String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return AppConstants.textRequired;
    } else if (text.length < 8) {
      return AppConstants.textPasswordLenghthError;
    }
    return null;
  }

  static String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return AppConstants.textRequired;
    } else if (!ValidationUtils.isEmailValid(text)) {
      return AppConstants.textInvalidEmail;
    }
    return null;
  }

  static String? validatePhone(String? text) {
    if (text == null || text.isEmpty) {
      return AppConstants.textRequired;
    } else if (text.length < 11 || text.length > 13) {
      return AppConstants.textInvalidPhone;
    }
    return null;
  }

  static String? validateConformPassword(String? passOne, String? passTwo){
    if(passOne != passTwo){
      return AppConstants.textPassNotMatched;
    }else{
      return null;
    }
  }

  static String? validateField(String? text) {
    if (text == null || text.isEmpty) {
      return AppConstants.textRequired;
    }
    return null;
  }
}