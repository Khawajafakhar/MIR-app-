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
import '../../widgets/buttons/text_button_widget.dart';
import '../../../ui/util/ui/validation_helper.dart';
import '../../../view_models/auth_viewmodel.dart';

class SigninScreen extends StatelessWidget {
   SigninScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    // bool isLoading = context.select<AuthViewModel,bool>((value) => value.getLoading);
    debugPrint("build");
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
                                onPressed: onForgotPassword,
                                textWidget: const TextWidget(
                                  text: AppConstants.textForgotPassword,
                                  color: AppColors.colorYellow,
                                  fontSize: Dimens.textRegular,
                                )),
                          ),
                          UIHelper.verticalSpaceSmall,
                          ctx.read<AuthViewModel>().getLoading == true
                              ? const CircularProgressIndicator(
                                  color: AppColors.colorWhite,
                                )
                              : ButtonWidget(
                                  txt: AppConstants.textLogin,
                                  onTap: onLogin,
                                ),
                          UIHelper.verticalSpaceXL,
                          TextWidget(
                              isRich: true,
                              text: AppConstants.textDontHaveAccount,
                              color: AppColors.colorWhite,
                              secondText: AppConstants.textRegister,
                              secondTextColor: AppColors.colorYellow,
                              fontSize: Dimens.textRegular,
                              onClicked: onRegister)
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

  void onForgotPassword() => Navigator.pushNamed(ctx, Routes.forgotPassword);

  void onLogin() async{
    if (_formKey.currentState!.validate()) {
      NavigatorState navigate = Navigator.of(ctx);
    await ctx.read<AuthViewModel>().login(
          email: emailController.text,
          password: passController.text,
          navigate: navigate);
    }
  }

  void onRegister() => Navigator.pushNamed(ctx, Routes.signUp);
}
