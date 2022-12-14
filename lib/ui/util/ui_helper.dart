import 'package:flutter/material.dart';

import '../../constants/dimens.dart';

class UIHelper{

  UIHelper._();
  static const Widget verticalSpaceSmall =
      SizedBox(height: Dimens.verticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: Dimens.verticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: Dimens.verticalSpaceLarge);
  static const Widget verticalSpaceXL =
      SizedBox(height: Dimens.verticalSpaceXL);
  static Widget verticalSpace(double height) => SizedBox(height: height);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: Dimens.horizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: Dimens.horizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: Dimens.horizontalSpaceLarge);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
}