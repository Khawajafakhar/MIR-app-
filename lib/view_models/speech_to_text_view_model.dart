import 'package:flutter/material.dart';
import 'package:mir_app/core/sharedpreferences/shared_prefs_helper.dart';
import 'package:mir_app/service/service_locator.dart';

import '../models/speech_to_text/text_media_model.dart';
import '../service/hive_sevices.dart';

class SpeechToTextViewModel with ChangeNotifier {
  
  void submitData(
    TextMedia data,
    BuildContext context,
  ) {
    HiveServices.addBox(
      locator<SharedPreferenceHelper>().getUser()!.id.toString(),
      data,
    );
    Navigator.of(context).pop();
  }
}
