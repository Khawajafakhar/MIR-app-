import 'package:hive/hive.dart';

part 'text_media_model.g.dart';

@HiveType(typeId: 0)
class TextMedia {
  @HiveField(0)
  DateTime? dateTime;
  @HiveField(1)
  String? discription;

  TextMedia({
    required this.dateTime,
    required this.discription,
  });
}
