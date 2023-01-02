import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
import '../../../view_models/speech_to_text_view_model.dart';
import '../../../ui/widgets/loading_widget.dart';
import '../../widgets/icon_widget.dart';

// ignore: must_be_immutable
class VoiceRecorderScreen extends StatefulWidget {
 const VoiceRecorderScreen({super.key});

  @override
  State<VoiceRecorderScreen> createState() => _VoiceRecorderScreenState();
}

class _VoiceRecorderScreenState extends State<VoiceRecorderScreen> {
  late BuildContext ctx;

  @override
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
            children: [
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
              child: FutureBuilder(
                  future: context.read<SpeechToTextViewModel>().fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    } else if (snapshot.data.isEmpty) {
                      return SizedBox(
                        child: Center(
                          child: IconWidget(
                            icon: Icons.add_circle_outline_outlined,
                            onTap: onAdd,
                            size: Dimens.iconLarge,
                          ),
                        ),
                      );
                    } else {
                      var data = snapshot.data.reversed.toList();
                      return ListView.separated(
                          itemCount: data.length,
                          itemBuilder: (context, index) => RecordTileWidget(
                                dateTime: data[index].dateTime,
                                discription: data[index].discription,
                              ),
                          separatorBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimens.horizontalSpaceMedium,
                                ),
                                child: DividerWidget(
                                  color: AppColors.colorWhite.withOpacity(0.2),
                                ),
                              ));
                    }
                  }))
        ],
      ),
    );
  }

  void onCallIcon() {
    Navigator.pushNamed(ctx, Routes.textMedia).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
  }

  void onAdd() {
    Navigator.pushNamed(ctx, Routes.textMedia).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
  }
}
