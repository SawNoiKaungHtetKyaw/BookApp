import 'package:bookapp/data/apply/book_apply.dart';
import 'package:bookapp/data/apply/book_apply_impl.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/shelves_vo/shelves_vo.dart';

class AddToShelveBloc extends ChangeNotifier {
  bool _dispose = false;
  List<ShelvesVo> _shelveList = [];

  ////Getter
  bool get isDispose => _dispose;
  List<ShelvesVo> get shelveList => _shelveList;

  ////State Instance
  final BookApply _apply = BookApplyImpl();

  AddToShelveBloc() {
    _apply.getShelvesFromDatabaseStream().listen((event) {
      _shelveList = event ?? [];
      notifyListeners();
    });
  }

  saveNewShelve(ShelvesVo shelveList) {
    _apply.saveShelve(shelveList);
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
