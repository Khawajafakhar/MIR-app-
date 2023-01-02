import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/dimens.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    this.icon,
    this.color=AppColors.colorWhite,
    this.size,
    this.onTap,
  });

  final IconData? icon;
  final Color? color;
  final double? size;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
