import 'package:flutter/material.dart';
import 'package:mir_app/ui/widgets/text_widget.dart';

class RecordTileWidget extends StatelessWidget {
  const RecordTileWidget({
    super.key,
    this.title,
    this.subTitle,
  });

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(
        text: title ?? '',
      ),
      subtitle: TextWidget(text: subTitle ?? ''),
    );
  }
}
