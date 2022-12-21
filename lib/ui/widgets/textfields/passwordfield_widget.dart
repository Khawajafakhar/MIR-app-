import 'package:flutter/material.dart';

import './textfield_widget.dart';
import '../../../constants/assets.dart';
import './../image_widget.dart';
import '../../../constants/colors.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required this.passController,
    this.validator,
    this.hint
  });

  final TextEditingController passController;
  final String? Function(String?)? validator;
  final String? hint;

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
      hint: widget.hint,
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
