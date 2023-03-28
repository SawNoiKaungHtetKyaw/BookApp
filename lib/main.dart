import 'package:bookapp/constants/hive_constants.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:bookapp/data/vos/buy_link_vo/buy_link_vo.dart';
import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:bookapp/data/vos/shelves_vo/shelves_vo.dart';
import 'package:bookapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main(List<String> args) async {
  await Hive.initFlutter();

  Hive.registerAdapter(ListNameVoAdapter());
  Hive.registerAdapter(BookVoAdapter());
  Hive.registerAdapter(BuyLinkVoAdapter());
  Hive.registerAdapter(ShelvesVoAdapter());

  await Hive.openBox<ListNameVo>(kHiveListNameBox);
  await Hive.openBox<ListNameVo>(kHiveFavListNameBox);
  await Hive.openBox<ShelvesVo>(kHiveShelveBox);
  await Hive.openBox<String>(kHiveHistoryNameBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
