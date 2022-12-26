import 'package:flutter/material.dart';
import 'package:mir_app/constants/app_constants.dart';
import 'package:mir_app/constants/assets.dart';
import 'package:mir_app/constants/colors.dart';
import 'package:mir_app/constants/dimens.dart';
import 'package:mir_app/ui/screens/voice_recorder/components/record_tile_widget.dart';
import 'package:mir_app/ui/widgets/appbar_widget.dart';
import 'package:mir_app/ui/widgets/divider_widget.dart';
import 'package:mir_app/ui/widgets/icon_widget.dart';
import 'package:mir_app/ui/widgets/image_widget.dart';
import 'package:mir_app/ui/widgets/text_widget.dart';

class VoiceRecorderScreen extends StatelessWidget {
  const VoiceRecorderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            children: const [
              ImageWidget(
                imagePath: AppAssets.iconCall911,
              ),
              Padding(
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
}
