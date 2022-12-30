// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_media_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextMediaAdapter extends TypeAdapter<TextMedia> {
  @override
  final int typeId = 0;

  @override
  TextMedia read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextMedia(
      dateTime: fields[0] as DateTime?,
      discription: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TextMedia obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.discription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextMediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
