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
    this.validator,
    this.maxLines = 1,
    this.isBorder = true,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool isObsecure;
  final TextInputAction? textInputAction;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      textInputAction: textInputAction,
      validator: validator,
      keyboardType: keyBoardType,
      cursorColor: AppColors.colorWhite,
      onChanged: onChanged,
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.colorWhite),
      decoration: InputDecoration(
        errorBorder: isBorder ? errorBorder : null,
        errorStyle: const TextStyle(color: AppColors.colorRed),
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
        suffixIcon: suffix != null
            ? Container(
                width: Dimens.textFieldPrefixWidth,
                alignment: Alignment.center,
                child: suffix,
              )
            : null,
        enabledBorder: isBorder ? enabledBorder : null,
        focusedBorder: isBorder ? focusedBorder : null,
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

  UnderlineInputBorder get errorBorder => const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.colorRed,
        ),
      );
}
