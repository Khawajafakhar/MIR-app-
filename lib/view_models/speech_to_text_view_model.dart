import 'package:flutter/material.dart';
import 'package:mir_app/core/sharedpreferences/shared_prefs_helper.dart';

import '../models/speech_to_text/text_media_model.dart';
import '../service/service_locator.dart';

class SpeechToTextViewModel with ChangeNotifier {

  void submitData(
    TextMedia data,
    BuildContext context,
  ) {
    locator<SharedPreferenceHelper>()
        .saveTextMedia(locator<SharedPreferenceHelper>().getUser()!.id, data);

    Navigator.of(context).pop();
  }
}
