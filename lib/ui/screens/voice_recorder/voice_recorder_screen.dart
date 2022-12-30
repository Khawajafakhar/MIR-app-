import 'package:flutter/material.dart';

import '../../../routes/routes.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimens.dart';
import './components/record_tile_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/divider_widget.dart';
import '../../widgets/image_widget.dart';
import '../../widgets/text_widget.dart';

// ignore: must_be_immutable
class VoiceRecorderScreen extends StatelessWidget {
   VoiceRecorderScreen({super.key});

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            children:  [
              ImageWidget(
                imagePath: AppAssets.iconCall911,
                onTap: onCallIcon,
              ),
             const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimens.verticalSpaceMedium,
                ),
                child: TextWidget(
                  text: AppConstants.textAudioToText,
                  fontSize: Dimens.textLarge,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )),
          DividerWidget(
            color: AppColors.colorWhite.withOpacity(0.2),
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const RecordTileWidget(),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.horizontalSpaceMedium,
                ),
                child: DividerWidget(
                  color: AppColors.colorWhite.withOpacity(0.2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void onCallIcon(){
  Navigator.pushNamed(ctx, Routes.textMedia);
  }
}
