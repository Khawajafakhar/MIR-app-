import 'package:flutter/material.dart';

import '../../../../constants/dimens.dart';
import '../../../widgets/image_widget.dart';
import '../../../widgets/text_widget.dart';
import '../../../../constants/colors.dart';

class MainButtonWidet extends StatelessWidget {
  const MainButtonWidet({
    super.key,
    required this.imagePath,
    required this.text,
    this.bottom,
    this.left,
    this.right,
    this.top,
  });

  final String imagePath;
  final String text;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Dimens.horizontalPaddingHome,
        left: Dimens.horizontalPaddingHome,
        bottom: Dimens.verticalPaddingHome,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: ImageWidget(
                imagePath: imagePath,
                boxFit: BoxFit.fill,
              ),
            ),
            Positioned(  
              top: top,
              bottom: bottom,
              right: right,
              left: left,          
              child: SizedBox(
                height: Dimens.sizedBoxHeight,
                width: Dimens.sizedBoxWidth,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: text,
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimens.textXM,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
