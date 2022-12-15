import 'package:flutter/material.dart';

import './text_widget.dart';
import '../../constants/colors.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.txt,
    this.isCenter = true,
  });

  final String? txt;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor,
      title: txt != null
          ? TextWidget(
              text: txt!,
              color: AppColors.colorWhite,
            )
          : null,
      centerTitle: isCenter,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
