import 'package:hive/hive.dart';

class HiveServices {

  static Future<void> addBox(
    String boxName,
    dynamic data,
  ) async {
    final box = await Hive.openBox(boxName);
    box.add(data);
  }

  static Future<dynamic> getBox({
    required dynamic key,
  }) async {
    final box = await Hive.openBox(key);
    return box.values;
  }
}
