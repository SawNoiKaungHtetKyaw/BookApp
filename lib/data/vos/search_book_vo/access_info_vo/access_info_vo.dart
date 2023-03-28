
import 'package:json_annotation/json_annotation.dart';

import '../epub_vo/epub_vo.dart';

part 'access_info_vo.g.dart';

@JsonSerializable()
class AccessInfo {

  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'viewability')
  String? viewability;

  @JsonKey(name: 'embeddable')
  bool? embeddable;

  @JsonKey(name: 'publicDomain')
  bool? publicDomain;

  @JsonKey(name: 'textToSpeechPermission')
  String? textToSpeechPermission;

  @JsonKey(name: 'epub')
  Epub? epub;

  @JsonKey(name: 'pdf')
  Epub? pdf;

  @JsonKey(name: 'webReaderLink')
  String? webReaderLink;

  @JsonKey(name: 'accessViewStatus')
  String? accessViewStatus;

  @JsonKey(name: 'quoteSharingAllowed')
  bool? quoteSharingAllowed;

  AccessInfo(
      {this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed});

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);
}
