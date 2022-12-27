import 'package:flutter/material.dart';
import 'package:mir_app/constants/app_constants.dart';
import 'package:mir_app/constants/dimens.dart';
import 'package:mir_app/ui/widgets/appbar_widget.dart';
import 'package:mir_app/ui/widgets/textfields/textfield_widget.dart';

class TextMediaScreen extends StatelessWidget {
  const TextMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(txt: AppConstants.textTextMedia),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
          child: TextFieldWidget(
            isBorder: false,
            maxLines: 100,
            hint: AppConstants.textWriteHere,
          ),
        ),
      ),
    );
  }
}
