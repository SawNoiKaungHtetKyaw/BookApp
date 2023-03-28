import 'package:bookapp/bloc/search_book_page_bloc.dart';
import 'package:bookapp/constants/colors.dart';
import 'package:bookapp/constants/strings.dart';
import 'package:bookapp/data/vos/search_book_vo/search_book_vo.dart';
import 'package:bookapp/widgets/easy_text.dart';
import 'package:bookapp/widgets/serach_bar_text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/demis.dart';

class SearchBookPage extends StatelessWidget {
  const SearchBookPage({super.key, required this.focusOnTextField});

  final bool? focusOnTextField;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchBookPageBloc>(
      create: (context) => SearchBookPageBloc(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: kSP10x),
                SearchBarTextField(
                  autofocus: focusOnTextField ?? false,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Selector<SearchBookPageBloc, List<SearchBookVo>>(
                    selector: (_, bloc) => bloc.getSearchBookList,
                    builder: (_, value, child) => (value.isNotEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.length,
                            itemBuilder: (context, index) =>
                                SearchBookListTileItemView(book: value[index]),
                          )
                        : Column(
                            children: [
                              Selector<SearchBookPageBloc,List<String>>(
                                selector: (_, bloc) => bloc.getHistoryBookList,
                                builder: (_, historyBooks, child) => 
                                 (historyBooks.isNotEmpty)?ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: historyBooks.length,
                                  itemBuilder: (context, index) {
                                    return SearchHistoryItemView(
                                        title: historyBooks[index]);
                                  },
                                ) : const SizedBox(),
                              ),
                              const SearchHistoryItemView(
                                title: kTopSelling,
                                icon: Icons.trending_up,
                              ),
                              const SearchHistoryItemView(
                                title: kNewReleases,
                                icon: Icons.new_releases,
                              ),
                              const SearchHistoryItemView(
                                title: kTopSelling,
                                icon: Icons.store,
                              ),
                            ],
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBookListTileItemView extends StatelessWidget {
  const SearchBookListTileItemView({super.key, required this.book});
  final SearchBookVo book;

  @override
  Widget build(BuildContext context) {
    String catagory;
    List catagories = book.volumeInfo?.categories ?? [];
    catagory = catagories.join(',');

    return ListTile(
      leading: SizedBox(
          width: 50,
          height: 50,
          child: Image.network(
            book.volumeInfo?.imageLinks?.smallThumbnail ??
                "http://via.placeholder.com/50x50",
            fit: BoxFit.cover,
          )),
      title: EasyText(
        text: book.volumeInfo?.title ?? '',
        textColor: kHintTextColor,
        fontSize: kFontSize16x,
        fontWeight: FontWeight.w500,
      ),
      subtitle: EasyText(
        text: catagory,
        textColor: kBorderColor,
      ),
    );
  }
}

class SearchHistoryItemView extends StatelessWidget {
  const SearchHistoryItemView(
      {super.key, required this.title, this.icon = Icons.history});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: EasyText(
        text: title,
        textColor: kHintTextColor,
        fontSize: kFontSize16x,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
