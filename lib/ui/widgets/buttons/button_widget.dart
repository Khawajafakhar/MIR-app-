import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../../../constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.buttonHeight,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.colorYellow,
        borderRadius: BorderRadius.circular(
          Dimens.buttonRadius,
        ),
      ),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: Dimens.buttonTextSizeLarge,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
