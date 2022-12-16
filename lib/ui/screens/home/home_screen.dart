import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../../constants/app_strings.dart';
import './components/main_button_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(txt: AppStrings.textHome),
        body: Column(
          children: const [
            Expanded(
                child: MainButtonWidet(
              imagePath: AppAssets.imageBgVoiceRecoreder,
              text: AppStrings.textVoiceRecorder,
              top: Dimens.stackTextPositioned,
              left: Dimens.stackTextPositioned,
            )),
            Expanded(
                child: MainButtonWidet(
              imagePath: AppAssets.imageBgStatement,
              text: AppStrings.textStatements,
              top: Dimens.stackTextPositioned,
              right: Dimens.stackTextPositioned,
            )),
            Expanded(
                child: MainButtonWidet(
              imagePath: AppAssets.imageBgMedia,
              text: AppStrings.textMedia,
              top: Dimens.stackTextPositioned,
              left: Dimens.stackTextPositioned,
            )),
            Expanded(
                child: MainButtonWidet(
              imagePath: AppAssets.imageBgMyIncident,
              text: AppStrings.textIncidentReport,
              top: Dimens.stackTextPositioned,
              right: Dimens.stackTextPositioned,
            )),
            Expanded(
                child: MainButtonWidet(
              imagePath: AppAssets.imageBgIncidentFolder,
              text: AppStrings.textIncidentReportFolder,
              top: Dimens.stackTextPositioned,
              left: Dimens.stackTextPositioned,
            )),
          ],
        ));
  }
}
