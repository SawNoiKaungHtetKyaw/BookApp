import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/book_results_vo/book_results_vo.dart';

part 'book_respone.g.dart';

@JsonSerializable()
class BookRespone {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'copyright')
  String? copyright;

  @JsonKey(name: 'num_results')
  int? numResults;

  @JsonKey(name: 'results')
  BookResultsVo? results;

  BookRespone(this.status, this.copyright, this.numResults, this.results);

  factory BookRespone.fromJson(Map<String, dynamic> json) =>
      _$BookResponeFromJson(json);
}