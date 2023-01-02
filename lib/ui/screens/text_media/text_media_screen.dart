import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/speech_to_text_provider.dart';
import '../../../constants/colors.dart';
import '../../widgets/icon_widget.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/dimens.dart';
import '../../widgets/textfields/textfield_widget.dart';
import '../../widgets/appbar_widget.dart';
import '../../../ui/util/validation/validaton_utils.dart';
import '../../../models/speech_to_text/text_media_model.dart';
import '../../../view_models/speech_to_text_view_model.dart';

class TextMediaScreen extends StatefulWidget {
  const TextMediaScreen({super.key});

  @override
  State<TextMediaScreen> createState() => _TextMediaScreenState();
}

class _TextMediaScreenState extends State<TextMediaScreen> {
  TextMedia textMedia = TextMedia(
    dateTime: null,
    discription: null,
  );
  late SpeechToTextProvider speechToTextProvider;

  TextEditingController textController = TextEditingController();

  @override
  void didChangeDependencies() {
    getListener();
    super.didChangeDependencies();
  }

  void getListener() {
    speechToTextProvider = context.watch<SpeechToTextProvider>();
    textController.text = speechToTextProvider.getLastWords;
    textController.selection = TextSelection.collapsed(
      offset: speechToTextProvider.getSpeechLength,
    );
  }

  @override
  void dispose() {
    speechToTextProvider.disposeText();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        txt: AppConstants.textTextMedia,
        isAction: true,
        btnText: textController.text != '' ? AppConstants.textSubmit : null,
        onPressed: onSubmit,
      ),
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
            onChanged: onTextChange,
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
            icon: speechToTextProvider.getSpeechToText.isListening
                ? Icons.mic
                : Icons.mic_off,
          ),
        ),
      ),
    );
  }

  void onTextChange(value) {
    if (ValidationUtils.isValid(value)) {
      speechToTextProvider.setLastWords = value;
      if (value.length == 1) {
        setState(() {});
      }
    } else {
      speechToTextProvider.onTextRemove(value);
    }
  }

  void onSubmit() {
    textMedia = TextMedia(
      dateTime: DateTime.now(),
      discription: textController.text,
    );
    context.read<SpeechToTextViewModel>().submitData(
          textMedia,
          context,
        );
  }
}
