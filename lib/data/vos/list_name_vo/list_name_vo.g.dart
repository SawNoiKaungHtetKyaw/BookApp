// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_name_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListNameVoAdapter extends TypeAdapter<ListNameVo> {
  @override
  final int typeId = 1;

  @override
  ListNameVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListNameVo(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as num?,
      fields[7] as num?,
      (fields[8] as List?)?.cast<BookVo>(),
      fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ListNameVo obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.listImageWidth)
      ..writeByte(7)
      ..write(obj.listImageHeight)
      ..writeByte(8)
      ..write(obj.books)
      ..writeByte(9)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListNameVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNameVo _$ListNameVoFromJson(Map<String, dynamic> json) => ListNameVo(
      json['list_id'] as int?,
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['updated'] as String?,
      json['list_image'] as String?,
      json['list_image_width'] as num?,
      json['list_image_height'] as num?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['order'] as int?,
    );

Map<String, dynamic> _$ListNameVoToJson(ListNameVo instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.books,
      'order': instance.order,
    };
