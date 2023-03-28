import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_respone.g.dart';

@JsonSerializable()
class SearchRespone {

  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'totalItems')
  int? totalItems;

  @JsonKey(name: 'items')
  List<SearchBookVo>? items;

  SearchRespone(this.kind, this.totalItems, this.items);

  factory SearchRespone.fromJson(Map<String, dynamic> json) =>
      _$SearchResponeFromJson(json);
}
