// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRespone _$BookResponeFromJson(Map<String, dynamic> json) => BookRespone(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['results'] == null
          ? null
          : BookResultsVo.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookResponeToJson(BookRespone instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
