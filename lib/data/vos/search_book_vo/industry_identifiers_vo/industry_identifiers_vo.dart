import 'package:json_annotation/json_annotation.dart';

part 'industry_identifiers_vo.g.dart';

@JsonSerializable()
class IndustryIdentifiers {

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: 'identifier')
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);
}
