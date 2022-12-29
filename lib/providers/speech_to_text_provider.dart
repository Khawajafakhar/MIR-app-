import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../constants/app_constants.dart';
import '.././ui/util/toast/toast.dart';

class SpeechToTextProvider with ChangeNotifier {
  SpeechToTextProvider(this._speechToText);

  // ignore: prefer_final_fields
  SpeechToText _speechToText;

  SpeechToText get getSpeechToText {
    return _speechToText;
  }

  String _lastWords = '';

  bool available = false;

  String get getLastWords {
    return _lastWords;
  }

  bool get isListening {
    if (_speechToText.isListening) {
      return true;
    } else {
      return false;
    }
  }

  initSpeechToText() async {
    available = await _speechToText.initialize();
  }

  Future<void> startSpeech() async {
    if (available) {
      await _speechToText.listen(
          onResult: _onSpeechResult,
          partialResults: false,
          listenFor: const Duration(seconds: 5),
          pauseFor: const Duration(seconds: 5));
      notifyListeners();
    } else {
      ToastMessage.show(AppConstants.textMicCantBeUsed, TOAST_TYPE.error);
    }
  }

  void stopListening() async {
    await _speechToText.stop();
    notifyListeners();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords += "${result.recognizedWords} ";
    notifyListeners();
  }

  void disposeText(){
    _lastWords = '';
  }
}
