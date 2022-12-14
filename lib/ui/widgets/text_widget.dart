import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';
import '../../constants/app_constants.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.text = AppConstants.placeHolderText,
    this.fontSize=Dimens.textMedium,
    this.color = AppColors.colorWhite,
    this.fontWeight,
    this.isRich = false,
    this.secondText,
    this.secondTextColor,
    this.onClicked,
    this.textAlign,
  });
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final bool isRich;
  final String? secondText;
  final Color? secondTextColor;
  final void Function()? onClicked;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return isRich
        ? RichText(
            text: TextSpan(
                text: text,
                style: TextStyle(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
                children: <TextSpan>[
                TextSpan(
                  text: secondText,
                  style: TextStyle(
                    color: secondTextColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      onClicked!();
                    },
                )
              ]))
        : Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
            ),
          );
  }
}
