import 'package:bookapp/constants/hive_constants.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_name_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveListNameType)
class ListNameVo {
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listId;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  String? listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  num? listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  num? listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<BookVo>? books;

  @HiveField(9)
  int? order;

  ListNameVo(
      this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books,
      this.order);

  factory ListNameVo.fromJson(Map<String, dynamic> json) =>
      _$ListNameVoFromJson(json);
}
