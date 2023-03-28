import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_results_vo.g.dart';

@JsonSerializable()
class BookResultsVo {

  @JsonKey(name: 'bestsellers_date')
  String? bestsellersDate;

  @JsonKey(name: 'published_date')
  String? publishedDate;

  @JsonKey(name: 'published_date_description')
  String? publishedDateDescription;

  @JsonKey(name: 'previous_published_date')
  String? previousPublishedDate;

  @JsonKey(name: 'next_published_date')
  String? nextPublishedDate;

  @JsonKey(name: 'lists')
  List<ListNameVo>? lists;

  BookResultsVo(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory BookResultsVo.fromJson(Map<String, dynamic> json) =>
      _$BookResultsVoFromJson(json);
}
