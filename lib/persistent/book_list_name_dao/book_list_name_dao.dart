import '../../data/vos/list_name_vo/list_name_vo.dart';
import '../../data/vos/shelves_vo/shelves_vo.dart';

abstract class BookListNameDAO {
  ///List Name
  void saveBookListName(List<ListNameVo> listName);
  List<ListNameVo>? getBookListNameFromDatabase();
  Stream watchListNameBox();
  Stream<List<ListNameVo>?> getBookListNameFromDatabaseStream();

  void saveShelve(ShelvesVo? shelveList);
  List<ShelvesVo>? getShelvesFromDatabase();
  Stream watchShelveBox();
  Stream<List<ShelvesVo>?> getShelvesFromDatabaseStream();

  void saveHistoryBookName(String? bookName);
  List<String>? getHistoryBookNameFromDatabase();
  Stream watchHistoryBookNameBox();
  Stream<List<String>?> getHistoryBookNameFromDatabaseStream();
}
