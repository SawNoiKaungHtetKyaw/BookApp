import 'package:bookapp/data/apply/book_apply_impl.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/apply/book_apply.dart';
import '../data/vos/shelves_vo/shelves_vo.dart';

class HomePageBloc extends ChangeNotifier {
  bool _dispose = false;
  List<ListNameVo> _bookList = [];
  int _selectedTab = 0;
  int _selectedTabBar = 0;
  List<ShelvesVo> _shelveList = [];
  List<BookVo> _carouselList = [];

  ///State Instance
  final BookApply _apply = BookApplyImpl();

  ///Constructor
  HomePageBloc() {
    print("Home page bloc");
    _apply.getBookListNameFromDatabaseStream().listen((event) {
      _bookList = event ?? [];
      notifyListeners();
    });
    _apply.getShelvesFromDatabaseStream().listen((event) {
      _shelveList = event ?? [];
      notifyListeners();
    });
  }

  ///Getter
  bool get isDispose => _dispose;
  List<ListNameVo> get getBookList => _bookList;
  int get getSelectedTab => _selectedTab;
  int get getSelectedTabBar => _selectedTabBar;
  List<ShelvesVo> get shelveList => _shelveList;
  List<BookVo> get getCarouselList => _carouselList;

  onTapFav(String title, int listId) {
    _bookList.forEach((bookListName) {
      if (bookListName.listId == listId) {
        List<BookVo> books = bookListName.books ?? [];
        books.forEach((element) {
          if (element.title == title) {
            element.isFav = !element.isFav;
            notifyListeners();
          }
        });
      }
    });
    _apply.saveBookListName(_bookList);
    notifyListeners();
  }

  saveNewShelve(ShelvesVo shelveList) {
    _apply.saveShelve(shelveList);
    notifyListeners();
  }

  addcarouselList(BookVo bookVo) {
    if (_carouselList == []) {
      _carouselList.add(bookVo);
    } else {
      List<String> list = [];
      _carouselList.forEach((element) {
        list.add(element.title ?? '');
      });

      if (!list.contains(bookVo.title)) {
        _carouselList.add(bookVo);
      }
    }
    notifyListeners();
  }

  onClickTabBar(int index) {
    _selectedTabBar = index;
    notifyListeners();
  }

  onTapBottomNavBar(int index) {
    _selectedTab = index;
    _selectedTabBar = 0;
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
