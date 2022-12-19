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
import '../../widgets/buttons/text_button_widget.dart';
import '../../../ui/util/ui/validation_helper.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

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
                UIHelper.verticalSpace(Dimens.verticalSpaceXXL),
                const TextWidget(
                  text: AppConstants.textLogin,
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
                            controller: emailController,
                            keyBoardType: TextInputType.emailAddress,
                            validator: (value) =>
                                ValidationHelper.validateEmail(value),
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconEmail),
                            hint: AppConstants.textHintLoginEmail,
                          ),
                          UIHelper.verticalSpaceMedium,
                          PasswordFieldWidget(
                            passController: passController,
                            validator: (value) =>
                                ValidationHelper.validatePassword(value),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButtonwidget(
                                onPressed: onClickedForgot,
                                textWidget: const TextWidget(
                                  text: AppConstants.textForgotPassword,
                                  color: AppColors.colorYellow,
                                  fontSize: Dimens.textRegular,
                                )),
                          ),
                          UIHelper.verticalSpaceSmall,
                          ButtonWidget(
                            txt: AppConstants.textLogin,
                            onTap: onClickedLogin,
                          ),
                          UIHelper.verticalSpaceXL,
                          TextWidget(
                              isRich: true,
                              text: AppConstants.textDontHaveAccount,
                              color: AppColors.colorWhite,
                              secondText: AppConstants.textRegister,
                              secondTextColor: AppColors.colorYellow,
                              fontSize: Dimens.textRegular,
                              onClicked: onClickedRegister)
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

  void onClickedForgot() {
    Navigator.pushNamed(ctx, Routes.forgotPassword);
  }

  void onClickedLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(ctx, Routes.home);
    }
  }

  void onClickedRegister() {
    Navigator.pushNamed(ctx, Routes.signUp);
  }
}
