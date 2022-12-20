import 'package:flutter/material.dart';

import '../../widgets/image_widget.dart';
import '../../../constants/assets.dart';
import '../../util/ui_helper.dart';
import '../../../constants/app_constants.dart';
import '../../widgets/text_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../widgets/textfields/passwordfield_widget.dart';
import '../../widgets/buttons/button_widget.dart';
import '../../../routes/routes.dart';
import '../../../ui/util/ui/validation_helper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpaceMedium,
                const Center(
                    child: ImageWidget(imagePath: AppAssets.imageLogo)),
                UIHelper.verticalSpaceLarge,
                const TextWidget(
                  text: AppConstants.textCreateAccount,
                  color: AppColors.colorYellow,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimens.textXL,
                ),
                UIHelper.verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.horizontalPadding),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFieldWidget(
                            controller: nameController,
                            keyBoardType: TextInputType.name,
                            validator: (value) =>
                                ValidationHelper.validateField(value),
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconUser),
                            hint: AppConstants.textFullName,
                          ),
                          UIHelper.verticalSpaceMedium,
                          TextFieldWidget(
                            controller: emailController,
                            keyBoardType: TextInputType.emailAddress,
                            validator: (value) =>
                                ValidationHelper.validateEmail(value),
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconEmail),
                            hint: AppConstants.textHintSignUpEmail,
                          ),
                          UIHelper.verticalSpaceMedium,
                          TextFieldWidget(
                            controller: phoneController,
                            keyBoardType: TextInputType.phone,
                            validator: (value) =>
                                ValidationHelper.validatePhone(value),
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconPhone),
                            hint: AppConstants.textMobile,
                          ),
                          UIHelper.verticalSpaceMedium,
                          PasswordFieldWidget(
                            passController: passController,
                            validator: (value) =>
                                ValidationHelper.validatePassword(value),
                          ),
                          UIHelper.verticalSpaceLarge,
                           ButtonWidget(
                            txt: AppConstants.textRegister,
                            onTap: onRegister,
                          ),
                          UIHelper.verticalSpaceXL,
                          TextWidget(
                              isRich: true,
                              text: AppConstants.textAlreadyHaveaccount,
                              color: AppColors.colorWhite,
                              secondText: AppConstants.textLogin,
                              secondTextColor: AppColors.colorYellow,
                              fontSize: Dimens.textRegular,
                              onClicked: onLogin)
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onRegister(){
    if(_formKey.currentState!.validate()){
     Navigator.pushReplacementNamed(ctx, Routes.home);
    }
  }

  void onLogin() =>
    Navigator.pushReplacementNamed(ctx, Routes.signIn);
  
}
