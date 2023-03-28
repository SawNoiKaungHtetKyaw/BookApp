
import 'package:json_annotation/json_annotation.dart';

part 'sale_info_vo.g.dart';

@JsonSerializable()
class SaleInfo {

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'saleability')
  String? saleability;

  @JsonKey(name: 'isEbook')
  bool? isEbook;

  SaleInfo({this.country, this.saleability, this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);
}