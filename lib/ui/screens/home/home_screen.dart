import 'package:flutter/material.dart';

import '../../widgets/appbar_widget.dart';
import '../../../constants/app_constants.dart';
import './components/main_button_widget.dart';
import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';
import '../../../routes/routes.dart';
import './components/drawer_widget.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          appBar: const AppBarWidget(txt: AppConstants.textHome),
          drawer:  DrawerWidget(),
          body: Column(
            children:  [
              Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgVoiceRecoreder,
                text: AppConstants.textVoiceRecorder,
                top: Dimens.stackTextPositioned,
                left: Dimens.stackTextPositioned,
                onTap: onVoiceRecorder,
              )),
             const Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgStatement,
                text: AppConstants.textStatements,
                top: Dimens.stackTextPositioned,
                right: Dimens.stackTextPositioned,
              )),
            const Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgMedia,
                text: AppConstants.textMedia,
                top: Dimens.stackTextPositioned,
                left: Dimens.stackTextPositioned,
              )),
             const Expanded(
                  child: MainButtonWidet(
                imagePath: AppAssets.imageBgMyIncident,
                text: AppConstants.textIncidentReport,
                top: Dimens.stackTextPositioned,
                right: Dimens.stackTextPositioned,
              )),
            const Expanded(
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
  void onVoiceRecorder(){
     Navigator.of(ctx).pushNamed(Routes.voiceRecorder);
  }

}
