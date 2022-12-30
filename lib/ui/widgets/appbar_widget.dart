import 'package:flutter/material.dart';

import './text_widget.dart';
import '../../constants/colors.dart';
import '../widgets/buttons/text_button_widget.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.txt,
    this.isCenter = true,
    this.isAction = false,
    this.btnText,
    this.onPressed,
  });

  final String? txt;
  final bool isCenter;
  final bool isAction;
  final String? btnText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor,
      title: txt != null
          ? TextWidget(
              text: txt!,
            )
          : null,
      actions: isAction
          ? [
              TextButtonwidget(
                textWidget: TextWidget(
                  text: btnText ?? '',
                  color: AppColors.colorYellow,
                ),
                onPressed: onPressed,
              )
            ]
          : null,
      centerTitle: isCenter,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
