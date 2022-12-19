
import '../../../models/auth/forgotpassword_model.dart';
import '../../../models/auth/signin_model.dart';
import '../../../models/auth/signup_model.dart';
import '../../../models/error_model.dart';

class Apimodels {
  static const String signInModel = "signin model";
  static const String signUpModel = "signup model";
  static const String forgotPasswordModel = "forgot password mode";
  static const String errorModel = "error model";

  static dynamic getmodelObjects({required String modelname,required dynamic json}){
    switch(modelname){
      case signInModel:
      return SignIn.fromJson(json);
      case signUpModel:
      return SignUp.fromJson(json);
      case forgotPasswordModel:
      return ForgotPassword.fromJson(json);
      case errorModel :
      return Error.fromJson(json);
    }
  }
}





