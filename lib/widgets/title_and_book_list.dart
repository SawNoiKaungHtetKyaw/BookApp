import 'package:bookapp/bloc/home_page_bloc.dart';
import 'package:bookapp/constants/strings.dart';
import 'package:bookapp/data/vos/list_name_vo/list_name_vo.dart';
import 'package:bookapp/pages/add_to_shelf.dart';
import 'package:bookapp/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import '../data/vos/book_vo/book_vo.dart';
import 'easy_text.dart';

class BookList extends StatefulWidget {
  const BookList(
      {super.key,
      required this.listName,
      required this.booksList,
      this.isFav = false});
  final ListNameVo listName;
  final List<BookVo> booksList;
  final bool isFav;

  @override
  State<BookList> createState() => _BookListState();
}

String title = '';

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    for (var e in widget.booksList) {
      if (e.isFav) {
        title = widget.listName.displayName ?? '';
        break;
      } else {
        title = '';
      }
    }
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: kSP15x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSP10x),
            child: EasyText(
              text: (widget.isFav) ? title : widget.listName.displayName ?? '',
              textColor: kTextColor,
              fontWeight: FontWeight.bold,
              fontSize: kFontSize16x,
            ),
          ),
          const SizedBox(height: kSP15x),
          SizedBox(
            width: double.maxFinite,
            height: kBookListHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.booksList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context
                      .read<HomePageBloc>()
                      .addcarouselList(widget.booksList[index]);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Details(bookVo: widget.booksList[index]),
                  ));
                },
                onLongPress: () {
                  showBottomSheetView(index);
                },
                child: (widget.isFav)
                    ? (widget.booksList[index].isFav)
                        ? Container(
                            width: kBookListWidth,
                            margin:
                                const EdgeInsets.symmetric(horizontal: kSP10x),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: kBookImageWidth,
                                  height: kBookImageHeight,
                                  margin: const EdgeInsets.only(bottom: kSP10x),
                                  decoration: BoxDecoration(
                                      color: kBlackColor,
                                      image: DecorationImage(
                                          image: NetworkImage(widget
                                                  .booksList[index].bookImage ??
                                              ''),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(kSP10x)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Consumer<HomePageBloc>(
                                        builder: (context, bloc, child) =>
                                            IconButton(
                                                onPressed: () {
                                                  bloc.onTapFav(
                                                      widget.booksList[index]
                                                              .title ??
                                                          '',
                                                      widget.listName.listId ??
                                                          0);
                                                  setState(() {});
                                                },
                                                icon: widget
                                                        .booksList[index].isFav
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        color: kFavoriteColor,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_outline,
                                                        color: kFavoriteColor,
                                                      )),
                                      )
                                    ],
                                  ),
                                ),
                                EasyText(
                                  text: widget.booksList[index].title ?? '',
                                  fontWeight: FontWeight.bold,
                                  textColor: kHintTextColor,
                                )
                              ],
                            ),
                          )
                        : const SizedBox()
                    : Container(
                        width: kBookListWidth,
                        margin: const EdgeInsets.symmetric(horizontal: kSP10x),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: kBookImageWidth,
                              height: kBookImageHeight,
                              margin: const EdgeInsets.only(bottom: kSP10x),
                              decoration: BoxDecoration(
                                  color: kBlackColor,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.booksList[index].bookImage ??
                                              ''),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(kSP10x)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Consumer<HomePageBloc>(
                                    builder: (context, bloc, child) =>
                                        IconButton(
                                            onPressed: () {
                                              bloc.onTapFav(
                                                  widget.booksList[index]
                                                          .title ??
                                                      '',
                                                  widget.listName.listId ?? 0);
                                            },
                                            icon: widget.booksList[index].isFav
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: kFavoriteColor,
                                                  )
                                                : const Icon(
                                                    Icons.favorite_outline,
                                                    color: kFavoriteColor,
                                                  )),
                                  )
                                ],
                              ),
                            ),
                            EasyText(
                              text: widget.booksList[index].title ?? '',
                              fontWeight: FontWeight.bold,
                              textColor: kHintTextColor,
                            )
                          ],
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future showBottomSheetView(int index) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(kSP10x),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSP10x),
                          image: DecorationImage(
                              image: NetworkImage(
                                  widget.booksList[index].bookImage ?? ''),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: kSP20x,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EasyText(
                          text: widget.booksList[index].title ?? '',
                          fontSize: kFontSize16x,
                          fontWeight: FontWeight.bold,
                          textColor: kHintTextColor,
                        ),
                        EasyText(
                          text: widget.booksList[index].author ?? '',
                          fontSize: kFontSize14x,
                          fontWeight: FontWeight.w500,
                          textColor: kBorderColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const EasyText(
                  text: kAddToShelf,
                  textColor: kHintTextColor,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AddToShelf(bookVo: widget.booksList[index])));
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const EasyText(
                  text: kDeleteFromShelf,
                  textColor: kHintTextColor,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
