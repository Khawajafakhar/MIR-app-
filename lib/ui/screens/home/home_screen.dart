import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../../constants/app_constants.dart';
import './components/main_button_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          appBar: const AppBarWidget(txt: AppConstants.textHome),
          body: Column(
            children: const [
              Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgVoiceRecoreder,
                text: AppConstants.textVoiceRecorder,
                top: Dimens.stackTextPositioned,
                left: Dimens.stackTextPositioned,
              )),
              Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgStatement,
                text: AppConstants.textStatements,
                top: Dimens.stackTextPositioned,
                right: Dimens.stackTextPositioned,
              )),
              Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgMedia,
                text: AppConstants.textMedia,
                top: Dimens.stackTextPositioned,
                left: Dimens.stackTextPositioned,
              )),
              Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgMyIncident,
                text: AppConstants.textIncidentReport,
                top: Dimens.stackTextPositioned,
                right: Dimens.stackTextPositioned,
              )),
              Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgIncidentFolder,
                text: AppConstants.textIncidentReportFolder,
                top: Dimens.stackTextPositioned,
                left: Dimens.stackTextPositioned,
              )),
            ],
          )),
    );
  }
}
