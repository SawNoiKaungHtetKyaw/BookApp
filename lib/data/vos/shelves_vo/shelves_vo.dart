import 'package:bookapp/constants/hive_constants.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:hive/hive.dart';

part 'shelves_vo.g.dart';

@HiveType(typeId: kHiveShelvesType)
class ShelvesVo {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? shelvesName;

  @HiveField(2)
  List<BookVo>? books;

  ShelvesVo(this.id, this.shelvesName, this.books);
}
