import 'package:json_annotation/json_annotation.dart';

part 'epub_vo.g.dart';

@JsonSerializable()
class Epub {

  @JsonKey(name: 'isAvailable')
  bool? isAvailable;

  Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);
}