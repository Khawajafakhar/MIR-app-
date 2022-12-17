import 'package:flutter/material.dart';

import '../text_widget.dart';

class TextButtonwidget extends StatelessWidget {
  const TextButtonwidget({
    super.key,
    this.onPressed,
    required this.textWidget,
  });

  final void Function()? onPressed;
  final TextWidget textWidget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: textWidget,
    );
  }
}
