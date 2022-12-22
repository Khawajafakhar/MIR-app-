import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    this.icon,
    this.color=AppColors.colorWhite,
  });

  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
    );
  }
}
