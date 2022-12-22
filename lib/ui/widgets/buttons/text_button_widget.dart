import 'package:flutter/material.dart';

import '../text_widget.dart';
import './../icon_widget.dart';

class TextButtonwidget extends StatelessWidget {
  const TextButtonwidget({
    super.key,
    this.onPressed,
    required this.textWidget,
    this.isIcon = false,
    this.icon,
  });

  final void Function()? onPressed;
  final TextWidget textWidget;
  final bool isIcon;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return isIcon
        ? TextButton.icon(
            onPressed: onPressed,
            icon: IconWidget(
              icon: icon,
            ),
            label: textWidget,
          )
        : TextButton(
            onPressed: onPressed,
            child: textWidget,
          );
  }
}
