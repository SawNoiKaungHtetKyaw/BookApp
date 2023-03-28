import 'package:bookapp/constants/api_constants.dart';
import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';
import 'package:bookapp/network/api/book_api.dart';
import 'package:bookapp/network/api/search_api.dart';
import 'package:bookapp/network/data_agent/book_data_agent.dart';
import 'package:dio/dio.dart';

import '../../data/vos/list_name_vo/list_name_vo.dart';

class BookDataAgentImpl extends BookDataAgent {
  late BookApi _api;
  late SearchApi _searchApi;

  BookDataAgentImpl._() {
    _api = BookApi(Dio());
    _searchApi = SearchApi(Dio());
  }

  static final BookDataAgentImpl _sigleton = BookDataAgentImpl._();

  factory BookDataAgentImpl() => _sigleton;

  @override
  Future<List<ListNameVo>?> getAllBookList() => _api
      .getBookRespone(kPublishedDateValue, kApiToken)
      .asStream()
      .map((event) => event.results)
      .map((event) => event?.lists ?? [])
      .first;

  @override
  Future<List<SearchBookVo>?> getSearchBookList(String search) => _searchApi
      .getSearchRespone(search)
      .asStream()
      .map((event) => event.items)
      .first;
}
