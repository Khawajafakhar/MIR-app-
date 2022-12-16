import 'package:flutter/material.dart';

import '../../widgets/image_widget.dart';
import '../../../constants/assets.dart';
import '../../util/ui_helper.dart';
import '../../../constants/app_strings.dart';
import '../../widgets/text_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../widgets/textfields/passwordfield_widget.dart';
import '../../widgets/buttons/button_widget.dart';
import '../../../routes/routes.dart';

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
                  text: AppStrings.textCreateAccount,
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
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconUser),
                            hint: AppStrings.textFullName,
                          ),
                          UIHelper.verticalSpaceMedium,
                          TextFieldWidget(
                            controller: emailController,
                            keyBoardType: TextInputType.emailAddress,
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconEmail),
                            hint: AppStrings.textHintSignUpEmail,
                          ),
                          UIHelper.verticalSpaceMedium,
                          TextFieldWidget(
                            controller: phoneController,
                            keyBoardType: TextInputType.phone,
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconPhone),
                            hint: AppStrings.textMobile,
                          ),
                          UIHelper.verticalSpaceMedium,
                          PasswordFieldWidget(
                            passController: passController,
                          ),
                          UIHelper.verticalSpaceLarge,
                          const ButtonWidget(txt: AppStrings.textRegister),
                          UIHelper.verticalSpaceXL,
                          TextWidget(
                              isRich: true,
                              text: AppStrings.textAlreadyHaveaccount,
                              color: AppColors.colorWhite,
                              secondText: AppStrings.textLogin,
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

  void onClickedRegister() {
    Navigator.pushReplacementNamed(ctx, Routes.signIn);
  }
}
