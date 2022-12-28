import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

import '../../../constants/colors.dart';
import '../../util/toast/toast.dart';
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
  SpeechToText speechToText = SpeechToText();

  String lastWords = '';

  bool available = false;

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    initSpeechToText();
    super.initState();
  }

  void initSpeechToText() async {
    available = await speechToText.initialize();
    setState(() {});
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
        animate: speechToText.isListening,
        glowColor: AppColors.colorYellow,
        child: FloatingActionButton(
          backgroundColor: AppColors.colorYellow,
          onPressed:
              speechToText.isListening ? _stopListening :_startSpeech,
          child: IconWidget(
            icon: speechToText.isListening ? Icons.mic :Icons.mic_off,
          ),
        ),
      ),
    );
  }

  Future<void> _startSpeech() async {
    if (available) {
     await speechToText.listen(
          onResult: _onSpeechResult,
          partialResults: false);
      setState(() {});
    } else {
      ToastMessage.show(AppConstants.textMicCantBeUsed, TOAST_TYPE.error);
    }
  }

  void _stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    lastWords += " ${result.recognizedWords}";
    setState(() {
      textController.text = lastWords;
    });
  }
}
