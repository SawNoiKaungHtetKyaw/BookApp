// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_link_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuyLinkVoAdapter extends TypeAdapter<BuyLinkVo> {
  @override
  final int typeId = 3;

  @override
  BuyLinkVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuyLinkVo(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BuyLinkVo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyLinkVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyLinkVo _$BuyLinkVoFromJson(Map<String, dynamic> json) => BuyLinkVo(
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$BuyLinkVoToJson(BuyLinkVo instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
