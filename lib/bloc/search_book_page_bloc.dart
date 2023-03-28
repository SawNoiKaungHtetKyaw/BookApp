import 'package:bookapp/data/apply/book_apply.dart';
import 'package:bookapp/data/apply/book_apply_impl.dart';
import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';
import 'package:flutter/foundation.dart';

class SearchBookPageBloc extends ChangeNotifier {
  bool _dispose = false;
  List<SearchBookVo> _searchBookList = [];
  List<String> _historyBookList = [];

  ///State Instance
  final BookApply _apply = BookApplyImpl();

  SearchBookPageBloc() {
    _apply.getHistoryBookNameFromDatabaseStream().listen((event) {
      _historyBookList = event ?? [];
      notifyListeners();
    });
  }

  ////Getter
  bool get isDispose => _dispose;
  List<SearchBookVo> get getSearchBookList => _searchBookList;
  List<String> get getHistoryBookList => _historyBookList;

  searchBook(String value) {
    if (value.isNotEmpty) {
      _apply.getSerachBookListFromNetwork(value).then((books) {
        _searchBookList = books ?? [];
        notifyListeners();
      });
    } else {
      _searchBookList = [];
      notifyListeners();
    }
  }

  addHistory(String value) {
    _apply.saveHistoryBookName(value);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
