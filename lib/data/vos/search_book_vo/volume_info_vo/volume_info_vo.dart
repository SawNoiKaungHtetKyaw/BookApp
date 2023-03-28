import 'package:json_annotation/json_annotation.dart';

import '../image_links_vo/image_links_vo.dart';
import '../industry_identifiers_vo/industry_identifiers_vo.dart';
import '../panelization_summary_vo/panelization_summary_vo.dart';
import '../reading_modes_vo/reading_modes_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
class VolumeInfo {

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'subtitle')
  String? subtitle;

  @JsonKey(name: 'publishedDate')
  String? publishedDate;

  @JsonKey(name: 'industryIdentifiers')
  List<IndustryIdentifiers>? industryIdentifiers;

  @JsonKey(name: 'readingModes')
  ReadingModes? readingModes;

  @JsonKey(name: 'printType')
  String? printType;

  @JsonKey(name: 'categories')
  List<String>? categories;

  @JsonKey(name: 'maturityRating')
  String? maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnonLogging;

  @JsonKey(name: 'contentVersion')
  String? contentVersion;

  @JsonKey(name: 'panelizationSummary')
  PanelizationSummary? panelizationSummary;

  @JsonKey(name: 'imageLinks')
  ImageLinks? imageLinks;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'previewLink')
  String? previewLink;

  @JsonKey(name: 'infoLink')
  String? infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.publishedDate,
      this.industryIdentifiers,
      this.readingModes,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}
