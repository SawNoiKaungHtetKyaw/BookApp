import 'package:bookapp/data/apply/book_apply.dart';
import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';
import 'package:bookapp/data/vos/shelves_vo/shelves_vo.dart';
import 'package:bookapp/network/data_agent/book_data_agent.dart';
import 'package:bookapp/network/data_agent/book_data_agent_impl.dart';
import 'package:bookapp/persistent/book_list_name_dao/book_list_name_dao.dart';
import 'package:bookapp/persistent/book_list_name_dao/book_list_name_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class BookApplyImpl extends BookApply {
  BookApplyImpl._();

  static final BookApplyImpl _singleton = BookApplyImpl._();

  factory BookApplyImpl() => _singleton;

  ///State Instance
  final BookDataAgent _bookDataAgent = BookDataAgentImpl();
  final BookListNameDAO _bookListNameDAO = BookListNameDAOImpl();

  ////Network Layer
  @override
  Future<List<ListNameVo>?> getAllBookListFromNetwork() =>
      _bookDataAgent.getAllBookList().then((value) {
        var temp = getBookListNameFromDatabase() ?? [];
        if (temp.isEmpty) {
          saveBookListName(value ?? []);
        }
        return value;
      });

  /////Database Layer
  @override
  List<ListNameVo>? getBookListNameFromDatabase() =>
      _bookListNameDAO.getBookListNameFromDatabase();

  @override
  Stream<List<ListNameVo>?> getBookListNameFromDatabaseStream() {
    getAllBookListFromNetwork();
    return _bookListNameDAO
        .watchListNameBox()
        .startWith(_bookListNameDAO.getBookListNameFromDatabaseStream())
        .map((event) => getBookListNameFromDatabase());
  }

  @override
  void saveBookListName(List<ListNameVo> listName) =>
      _bookListNameDAO.saveBookListName(listName);

  @override
  Future<List<SearchBookVo>?> getSerachBookListFromNetwork(String search) =>
      _bookDataAgent.getSearchBookList(search);

  @override
  List<ShelvesVo>? getShelvesFromDatabase() =>
      _bookListNameDAO.getShelvesFromDatabase();

  @override
  Stream<List<ShelvesVo>?> getShelvesFromDatabaseStream() {
    return _bookListNameDAO
        .watchShelveBox()
        .startWith(_bookListNameDAO.getShelvesFromDatabaseStream())
        .map((event) => getShelvesFromDatabase());
  }

  @override
  void saveShelve(ShelvesVo? shelveList) =>
      _bookListNameDAO.saveShelve(shelveList);

  @override
  List<String>? getHistoryBookNameFromDatabase() =>
      _bookListNameDAO.getHistoryBookNameFromDatabase();

  @override
  Stream<List<String>?> getHistoryBookNameFromDatabaseStream() =>
      _bookListNameDAO
          .watchHistoryBookNameBox()
          .startWith(_bookListNameDAO.getHistoryBookNameFromDatabaseStream())
          .map((event) => getHistoryBookNameFromDatabase());

  @override
  void saveHistoryBookName(String? bookName) =>
      _bookListNameDAO.saveHistoryBookName(bookName);
}
