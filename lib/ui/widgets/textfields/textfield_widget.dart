import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    this.hint,
    this.prefix,
    this.suffix,
    this.isObsecure = false,
    this.textInputAction = TextInputAction.next,
    this.keyBoardType,
  });

  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool isObsecure;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      textInputAction: textInputAction,
      keyboardType: keyBoardType,
      cursorColor: AppColors.colorWhite,
      style: const TextStyle(color: AppColors.colorWhite),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.colorWhite.withOpacity(0.7),
        ),
        prefixIcon: prefix != null
            ? Container(
                width: Dimens.textFieldPrefixWidth,
                alignment: Alignment.center,
                child: prefix,
              )
            : null,
        suffixIcon: suffix ?? const SizedBox(),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
      ),
    );
  }

  UnderlineInputBorder get enabledBorder => const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.colorWhite,
        ),
      );

  UnderlineInputBorder get focusedBorder => const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.colorWhite,
        ),
      );
}
