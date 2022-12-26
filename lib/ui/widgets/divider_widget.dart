import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    this.color = AppColors.colorWhite,
    this.thickness = Dimens.dividerSmall
  });

  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
    );
  }
}
