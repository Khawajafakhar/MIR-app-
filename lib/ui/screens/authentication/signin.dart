import 'package:flutter/material.dart';

import '../../widgets/image_widget.dart';
import '../../../constants/images.dart';
import '../../util/ui_helper.dart';
import '../../../constants/app_strings.dart';
import '../../widgets/text_widget.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            UIHelper.verticalSpaceMedium,
            const Center(child: ImageWidget(imagePath: AppImages.imageLogo)),
            UIHelper.verticalSpace(70),
            const TextWidget(
              text: AppStrings.textLogin,
              color: AppColors.colorYellow,
              fontWeight: FontWeight.bold,
              fontSize: Dimens.textLarge,
            )
          ],
        ),
      ),
    );
  }
}
