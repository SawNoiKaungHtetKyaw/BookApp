import 'package:bookapp/data/vos/search_book_vo/sale_info_vo/sale_info_vo.dart';
import 'package:bookapp/data/vos/search_book_vo/search_info_vo/search_info_vo.dart';
import 'package:bookapp/data/vos/search_book_vo/volume_info_vo/volume_info_vo.dart';
import 'package:json_annotation/json_annotation.dart';

import 'access_info_vo/access_info_vo.dart';

part 'search_book_vo.g.dart';

@JsonSerializable()
class SearchBookVo {

  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'etag')
  String? etag;

  @JsonKey(name: 'selfLink')
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  VolumeInfo? volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfo? saleInfo;

  @JsonKey(name: 'accessInfo')
  AccessInfo? accessInfo;

  @JsonKey(name: 'searchInfo')
  SearchInfo? searchInfo;

  SearchBookVo(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo});

  factory SearchBookVo.fromJson(Map<String, dynamic> json) =>
      _$SearchBookVoFromJson(json);
}

