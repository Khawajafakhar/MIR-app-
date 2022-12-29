import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/speech_to_text_provider.dart';
import '../../../constants/colors.dart';
import '../../widgets/icon_widget.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/dimens.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/textfields/textfield_widget.dart';

class TextMediaScreen extends StatefulWidget {
  const TextMediaScreen({super.key});

  @override
  State<TextMediaScreen> createState() => _TextMediaScreenState();
}

class _TextMediaScreenState extends State<TextMediaScreen> {
  late SpeechToTextProvider speechToTextProvider;

  TextEditingController textController = TextEditingController();

  @override
  void didChangeDependencies() {
    initSpeechToText();
    super.didChangeDependencies();
  }

  void initSpeechToText() {
    speechToTextProvider = context.watch<SpeechToTextProvider>();
    textController.text = speechToTextProvider.getLastWords;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(txt: AppConstants.textTextMedia),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
          child: TextFieldWidget(
            controller: textController,
            isBorder: false,
            maxLines: 100,
            hint: AppConstants.textWriteHere,
            textInputAction: TextInputAction.newline,
          ),
        ),
      ),
      floatingActionButton: AvatarGlow(
        endRadius: 40,
        animate: speechToTextProvider.getSpeechToText.isListening,
        glowColor: AppColors.colorYellow,
        child: FloatingActionButton(
          backgroundColor: AppColors.colorYellow,
          onPressed: speechToTextProvider.getSpeechToText.isListening
              ? speechToTextProvider.stopListening
              : speechToTextProvider.startSpeech,
          child: IconWidget(
            icon: speechToTextProvider.getSpeechToText.isListening ? Icons.mic : Icons.mic_off,
          ),
        ),
      ),
    );
  }

  
}
