// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelves_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelvesVoAdapter extends TypeAdapter<ShelvesVo> {
  @override
  final int typeId = 4;

  @override
  ShelvesVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelvesVo(
      fields[0] as String?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<BookVo>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShelvesVo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.shelvesName)
      ..writeByte(2)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelvesVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
