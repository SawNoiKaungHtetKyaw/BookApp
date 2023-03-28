import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';

import '../vos/shelves_vo/shelves_vo.dart';

abstract class BookApply {
  ///Apply From Network
  Future<List<ListNameVo>?> getAllBookListFromNetwork();
  Future<List<SearchBookVo>?> getSerachBookListFromNetwork(String search);

  ///Apply From Database
  void saveBookListName(List<ListNameVo> listName);
  List<ListNameVo>? getBookListNameFromDatabase();
  Stream<List<ListNameVo>?> getBookListNameFromDatabaseStream();

  void saveShelve(ShelvesVo shelveList);
  List<ShelvesVo>? getShelvesFromDatabase();
  Stream<List<ShelvesVo>?> getShelvesFromDatabaseStream();

  void saveHistoryBookName(String? bookName);
  List<String>? getHistoryBookNameFromDatabase();
  Stream<List<String>?> getHistoryBookNameFromDatabaseStream();
}
