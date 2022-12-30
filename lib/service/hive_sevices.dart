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
    required String boxName,
    required dynamic key,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.get(key);
  }
}
