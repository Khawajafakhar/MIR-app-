import 'package:flutter/material.dart';

import './textfield_widget.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/assets.dart';
import './../image_widget.dart';
import '../../../constants/colors.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required this.passController,
    this.validator,
  });

  final TextEditingController passController;
  final String? Function(String?)? validator;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: widget.passController,
      isObsecure: isObsecure,
      validator: widget.validator,
      textInputAction: TextInputAction.done,
      keyBoardType: TextInputType.visiblePassword,
      hint: AppConstants.textHintPassword,
      prefix: const ImageWidget(imagePath: AppAssets.iconPass),
      suffix: InkWell(
        onTap: () {
          setState(() {
            isObsecure = !isObsecure;
          });
        },
        child: isObsecure
            ? Icon(
                Icons.visibility_off_outlined,
                color: AppColors.colorWhite.withOpacity(0.7),
              )
            : Icon(
                Icons.visibility_outlined,
                color: AppColors.colorWhite.withOpacity(0.7),
              ),
      ),
    );
  }
}
