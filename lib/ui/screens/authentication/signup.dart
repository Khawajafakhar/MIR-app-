import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
import '../../../view_models/auth_viewmodel.dart';
import '../../widgets/loading_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final TextEditingController confirmPassController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.select<AuthViewModel, bool>(
        (authViewModel) => authViewModel.getLoading);
    ctx = context;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                UIHelper.verticalSpaceSmall,
                const Center(
                    child: ImageWidget(imagePath: AppAssets.imageLogo)),
                UIHelper.verticalSpaceSmall,
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
                            hint: AppConstants.textHintPassword,
                            validator: (value) =>
                                ValidationHelper.validatePassword(value),
                          ),
                          UIHelper.verticalSpaceMedium,
                          PasswordFieldWidget(
                            passController: confirmPassController,
                            hint: AppConstants.textHintConformPassword,
                            validator: (value) =>
                                ValidationHelper.validateConformPassword(
                              value,
                              passController.text,
                            ),
                          ),
                          UIHelper.verticalSpaceMedium,
                          isLoading
                              ? const LoadingWidget()
                              : ButtonWidget(
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

  void onRegister() async {
    if (_formKey.currentState!.validate()) {
      await ctx.read<AuthViewModel>().register(
            email: emailController.text,
            name: nameController.text,
            phone: phoneController.text,
            password: passController.text,
            confirmPassword: confirmPassController.text,
            context: ctx,
          );
    }
  }

  void onLogin() => Navigator.pushReplacementNamed(ctx, Routes.signIn);
}
