import 'package:flutter/material.dart';

import '../../widgets/image_widget.dart';
import '../../../constants/assets.dart';
import '../../util/ui_helper.dart';
import '../../../constants/app_strings.dart';
import '../../widgets/text_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../widgets/buttons/button_widget.dart';
import '../../../routes/routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

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
                 text: AppStrings.textResetPassword,
                 color: AppColors.colorYellow,
                 fontWeight: FontWeight.bold,
                 fontSize: Dimens.textLarge,
                 textAlign: TextAlign.center,
               ),
                UIHelper.verticalSpaceLarge,
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
                            prefix: const ImageWidget(
                                imagePath: AppAssets.iconEmail),
                            hint: AppStrings.textHintLoginEmail,
                          ),
                          UIHelper.verticalSpaceLarge,                      
                          ButtonWidget(
                            txt: AppStrings.textReset,
                            onTap: (){},
                          ),
                          UIHelper.verticalSpaceXL,
                          TextWidget(
                              isRich: true,
                              text: AppStrings.textDontHaveAccount,
                              color: AppColors.colorWhite,
                              secondText: AppStrings.textRegister,
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
  void onClickedRegister(){
    Navigator.pushReplacementNamed(ctx, Routes.signUp);
  }
  }