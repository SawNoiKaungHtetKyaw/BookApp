import 'package:bookapp/bloc/add_to_shelve_bloc.dart';
import 'package:bookapp/constants/strings.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:bookapp/data/vos/shelves_vo/shelves_vo.dart';
import 'package:bookapp/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import '../widgets/create_floating_button.dart';
import '../widgets/easy_text.dart';

class AddToShelf extends StatelessWidget {
  const AddToShelf({super.key, required this.bookVo});
  final BookVo bookVo;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddToShelveBloc>(
      create: (_) => AddToShelveBloc(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const CreateNewFloatingActionButton(),
        appBar: AppBar(
          backgroundColor: kFavoriteColor,
          title: const Text(kAddToShelf),
        ),
        body: Selector<AddToShelveBloc, List<ShelvesVo>>(
          selector: (_, bloc) => bloc.shelveList,
          builder: (context, shelveList, child) => (shelveList.isNotEmpty)
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: shelveList.length,
                  itemBuilder: (context, index) {
                    List<BookVo> books = shelveList[index].books ?? [];
                    return ShelfListTileItemView(
                      shelve: shelveList[index],
                      bookVo: bookVo,
                    );
                  })
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.library_add,
                      size: kIconSize,
                      color: kBorderColor,
                    ),
                    Center(
                      child: EasyText(
                        text: kNoShelvesInLibrary,
                        fontWeight: FontWeight.bold,
                        textColor: kBorderColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ShelfListTileItemView extends StatelessWidget {
  const ShelfListTileItemView(
      {super.key, required this.shelve, required this.bookVo});

  final ShelvesVo shelve;
  final BookVo bookVo;

  @override
  Widget build(BuildContext context) {
    List<BookVo> books = shelve.books ?? [];
    return Consumer<AddToShelveBloc>(
      builder: (context, bloc, child) => ListTile(
        leading: SizedBox(
          width: kTabBarHeight,
          height: kTabBarHeight,
          child: (books.isNotEmpty)
              ? Image.network(
                  books[0].bookImage ?? kDefaultImage,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  kDefaultImage,
                  fit: BoxFit.cover,
                ),
        ),
        title: EasyText(
          text: shelve.shelvesName ?? '',
          fontWeight: FontWeight.bold,
        ),
        subtitle: EasyText(
          text: shelve.books?.length.toString().getVote() ?? "0".getVote(),
          textColor: kHintTextColor,
          fontSize: kFontSize12x,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: kSP20x,
        ),
        onTap: () {
          var bookList = shelve.books ?? [];
          if (bookList == []) {
            bookList.add(bookVo);
          } else {
            List<String> list = [];
            bookList.forEach((element) {
              list.add(element.title ?? '');
            });
            if (!list.contains(bookVo.title)) {
              bookList.add(bookVo);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: EasyText(text: kAddSuccessfully,textColor: kWhiteColor,)));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: EasyText(text: kAlreadyHave,textColor: kWhiteColor)));
            }
          }
          var shelveList = ShelvesVo(shelve.id, shelve.shelvesName, bookList);
          bloc.saveNewShelve(shelveList);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
