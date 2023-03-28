import 'package:bookapp/constants/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_link_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveBuyLinkType)
class BuyLinkVo {
  @JsonKey(name: 'name')
  @HiveField(0)
  String? name;

  @JsonKey(name: 'url')
  @HiveField(1)
  String? url;

  BuyLinkVo(this.name, this.url); 

  factory BuyLinkVo.fromJson(Map<String, dynamic> json) =>
      _$BuyLinkVoFromJson(json);
}
