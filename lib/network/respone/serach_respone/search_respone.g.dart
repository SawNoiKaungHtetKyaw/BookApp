// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRespone _$SearchResponeFromJson(Map<String, dynamic> json) =>
    SearchRespone(
      json['kind'] as String?,
      json['totalItems'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => SearchBookVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponeToJson(SearchRespone instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
