import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';

abstract class BookDataAgent {
  Future<List<ListNameVo>?> getAllBookList();
  Future<List<SearchBookVo>?> getSearchBookList(String search);
}
