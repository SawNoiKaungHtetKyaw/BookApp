import 'package:bookapp/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';
import '../constants/colors.dart';
import '../constants/demis.dart';
import '../constants/strings.dart';
import '../data/vos/book_vo/book_vo.dart';
import '../data/vos/list_name_vo/list_name_vo.dart';
import '../data/vos/shelves_vo/shelves_vo.dart';
import '../pages/search_book_page.dart';
import '../widgets/easy_text.dart';
import '../widgets/title_and_book_list.dart';

class HomePageItemView extends StatelessWidget {
  const HomePageItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<ListNameVo>>(
      selector: (_, bloc) => bloc.getBookList,
      builder: (_, bookList, child) => Expanded(
          child: (bookList.isEmpty)
              ? Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(width: kSP10x),
                        EasyText(
                            text: kLoading,
                            fontSize: kSP15x,
                            fontWeight: FontWeight.bold,
                            textColor: kHintTextColor)
                      ]),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: bookList.length,
                  itemBuilder: (context, index) => BookList(
                      listName: bookList[index],
                      booksList: bookList[index].books ?? []),
                )),
    );
  }
}

class SearchBarButtonItemView extends StatelessWidget {
  const SearchBarButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, kTabBarHeight)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const SearchBookPage(focusOnTextField: true),
            ));
          },
          child: Row(
            children: const [
              Icon(
                Icons.search_rounded,
                color: kBorderColor,
                size: 28,
              ),
              EasyText(
                text: kSerachHintText,
                textColor: kHintTextColor,
                fontWeight: FontWeight.w500,
              )
            ],
          )),
    );
  }
}

class BottomNavigationBarItemView extends StatelessWidget {
  const BottomNavigationBarItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, int>(
      selector: (_, bloc) => bloc.getSelectedTab,
      builder: (_, selectedValue, child) => BottomNavigationBar(
        currentIndex: selectedValue,
        onTap: (index) => context.read<HomePageBloc>().onTapBottomNavBar(index),
        backgroundColor: kBackGroungColor,
        selectedItemColor: kFavoriteColor,
        unselectedItemColor: kHintTextColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: kHome),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: kLibrary)
        ],
      ),
    );
  }
}

class LibraryItemView extends StatelessWidget {
  const LibraryItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: kTabBarHeight,
            child: AppBar(
              backgroundColor: kBackGroungColor,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: kFavoriteColor,
                indicatorWeight: 3,
                indicatorPadding:
                    const EdgeInsets.symmetric(horizontal: kSP20x),
                onTap: (value) =>
                    context.read<HomePageBloc>().onClickTabBar(value),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: kSP10x),
                    child: EasyText(
                        text: kYourBooks,
                        fontWeight: FontWeight.bold,
                        textColor: kHintTextColor),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: kSP10x),
                    child: EasyText(
                        text: kYourShelves,
                        fontWeight: FontWeight.bold,
                        textColor: kHintTextColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              Selector<HomePageBloc, List<ListNameVo>>(
                  selector: (_, bloc) => bloc.getBookList,
                  builder: (_, bookList, child) {
                    return (bookList.isNotEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: bookList.length,
                            itemBuilder: (context, index) => BookList(
                              listName: bookList[index],
                              booksList: bookList[index].books ?? [],
                              isFav: true,
                            ),
                          )
                        : SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.heart_broken_outlined,
                                  size: kIconSize,
                                  color: kBorderColor,
                                ),
                                EasyText(
                                  text: kNoBookInLibrary,
                                  fontWeight: FontWeight.bold,
                                  textColor: kBorderColor,
                                )
                              ],
                            ),
                          );
                  }),
              Selector<HomePageBloc, List<ShelvesVo>>(
                selector: (_, bloc) => bloc.shelveList,
                builder: (context, shelveList, child) => SizedBox(
                  child: (shelveList.isNotEmpty)
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: shelveList.length,
                          itemBuilder: (context, index) {
                            List<BookVo> books = shelveList[index].books ?? [];
                            return ShelfListTileView(
                              shelve: shelveList[index],
                            );
                          })
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.library_add,
                              size: kIconSize,
                              color: kBorderColor,
                            ),
                            EasyText(
                              text: kNoShelvesInLibrary,
                              fontWeight: FontWeight.bold,
                              textColor: kBorderColor,
                            ),
                          ],
                        ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class CreateNewFloatingActionButtonItemView extends StatelessWidget {
  const CreateNewFloatingActionButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return FloatingActionButton.extended(
      backgroundColor: kFavoriteColor,
      foregroundColor: kWhiteColor,
      onPressed: () async {
        await showAlertDialiog(context, _controller, _formKey, () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pop();
            ShelvesVo shelvesVo = ShelvesVo(
                DateTime.now().millisecondsSinceEpoch.toString(),
                _controller.text, []);
            context.read<HomePageBloc>().saveNewShelve(shelvesVo);
          }
        });
      },
      icon: const Icon(Icons.edit),
      label: const EasyText(
        text: kCreateNew,
        textColor: kWhiteColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future showAlertDialiog(BuildContext context,
      TextEditingController controller, var formKey, Function onTap) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(kCreateNewShelve),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(hintText: kEnterShelve),
                validator: (value) {
                  if (value!.isEmpty) {
                    return kErrorEnterShelve;
                  }
                  return null;
                },
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () => onTap(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kFavoriteColor),
                  child: const EasyText(
                    text: kCreateNew,
                    textColor: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  )),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kFavoriteColor),
                  child: const EasyText(
                    text: kCancel,
                    textColor: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          );
        });
  }
}

class ShelfListTileView extends StatelessWidget {
  const ShelfListTileView(
      {super.key, required this.shelve});

  final ShelvesVo shelve;

  @override
  Widget build(BuildContext context) {
    List<BookVo> books = shelve.books ?? [];
    return Consumer<HomePageBloc>(
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
          print("to books");
          // var bookList = shelve.books ?? [];
          // if (bookList == []) {
          //   bookList.add(bookVo);
          // } else {
          //   List<String> list = [];
          //   bookList.forEach((element) {
          //     list.add(element.title ?? '');
          //   });
          //   if (!list.contains(bookVo.title)) {
          //     bookList.add(bookVo);
          //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //         content: EasyText(text: kAddSuccessfully,textColor: kWhiteColor,)));
          //   }else{
          //     ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: EasyText(text: kAlreadyHave,textColor: kWhiteColor)));
          //   }
          // }
          // var shelveList = ShelvesVo(shelve.id, shelve.shelvesName, bookList);
          // bloc.saveNewShelve(shelveList);
          // Navigator.of(context).pop();
        },
      ),
    );
  }
}
