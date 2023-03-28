import 'package:bookapp/constants/hive_constants.dart';
import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:bookapp/data/vos/shelves_vo/shelves_vo.dart';
import 'package:bookapp/persistent/book_list_name_dao/book_list_name_dao.dart';
import 'package:hive/hive.dart';

class BookListNameDAOImpl extends BookListNameDAO {
  BookListNameDAOImpl._();
  static final BookListNameDAOImpl _singleton = BookListNameDAOImpl._();
  factory BookListNameDAOImpl() => _singleton;

  int count = 0;

  Box<ListNameVo> _getListNameBox() => Hive.box<ListNameVo>(kHiveListNameBox);

  @override
  List<ListNameVo>? getBookListNameFromDatabase() {
    List<ListNameVo> temp = _getListNameBox().values.toList();
    temp.sort((a, b) {
      int value1 = a.order ?? 0;
      int value2 = b.order ?? 0;
      return value1 > value2 ? 1 : -1;
    });
    return temp;
  }

  @override
  Stream<List<ListNameVo>?> getBookListNameFromDatabaseStream() =>
      Stream.value(getBookListNameFromDatabase());

  @override
  void saveBookListName(List<ListNameVo> listName) {
    listName.forEach((book) {
      count++;
      book.order = count;
      _getListNameBox().put(book.listId, book);
    });
  }

  @override
  Stream watchListNameBox() => _getListNameBox().watch();

  //=======================================

  Box<ShelvesVo> _getShelveVo() => Hive.box(kHiveShelveBox);

  @override
  List<ShelvesVo>? getShelvesFromDatabase() => _getShelveVo().values.toList();

  @override
  Stream<List<ShelvesVo>?> getShelvesFromDatabaseStream() =>
      Stream.value(getShelvesFromDatabase());

  @override
  void saveShelve(ShelvesVo? shelveList) {
    _getShelveVo().put(shelveList?.id ?? 1, shelveList!);
  }

  @override
  Stream watchShelveBox() => _getShelveVo().watch();

  Box<String> _getHistoryBookNameBox() => Hive.box(kHiveHistoryNameBox);

  @override
  List<String>? getHistoryBookNameFromDatabase() =>
      _getHistoryBookNameBox().values.toList();

  @override
  Stream<List<String>?> getHistoryBookNameFromDatabaseStream() =>
      Stream.value(getHistoryBookNameFromDatabase());

  @override
  void saveHistoryBookName(String? bookName) => _getHistoryBookNameBox()
      .put(DateTime.now().millisecondsSinceEpoch.toString(), bookName ?? '');

  @override
  Stream watchHistoryBookNameBox() => _getHistoryBookNameBox().watch();
}
