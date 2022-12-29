import 'dart:core';

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

  int get getSpeechLength {
    return _lastWords.length;
  }

  set setLastWords(String value) {
    String val = value;
    _lastWords = "$val ";
  }

  initSpeechToText() async {
    available = await _speechToText.initialize(
      onError: (_) => _speechToText.stop(),
    );
  }

  Future<void> startSpeech() async {
    if (available) {
      Stopwatch stopwatch = Stopwatch();
      await _speechToText.listen(
          onResult: _onSpeechResult,
          onSoundLevelChange: (_) {
            if (!_speechToText.hasRecognized) {
              stopwatch.start();
              if (stopwatch.elapsed.inSeconds >= 4) {
                _speechToText.stop();
                notifyListeners();
                stopwatch.stop();
              }
            }
          },
          partialResults: false,
          listenMode: ListenMode.deviceDefault,
          listenFor: const Duration(
            seconds: 5,
          ),
          pauseFor: const Duration(
            seconds: 5,
          ),
          cancelOnError: true);

      notifyListeners();
    } else {
      ToastMessage.show(AppConstants.textMicCantBeUsed, TOAST_TYPE.error);
    }
  }

  void stopListening() async {
    await _speechToText.stop();
    notifyListeners();
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    _lastWords += "${result.recognizedWords} ";
    notifyListeners();
  }

  void disposeText() {
    _lastWords = '';
  }

  void onTextRemove(value) {
    _lastWords = '';
    notifyListeners();
  }
}
