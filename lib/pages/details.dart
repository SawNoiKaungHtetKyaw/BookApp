import 'package:bookapp/constants/colors.dart';
import 'package:bookapp/constants/demis.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:bookapp/widgets/easy_text.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../itemview/details_itemview.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.bookVo});

  final BookVo bookVo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kFavoriteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: Column(
        children: [
          DetailsImageAndTitleItemView(bookVo: bookVo),
          const SizedBox(height: kSP15x),
          OverViewItemView(bookVo: bookVo),
          const ReadNowButtonItemView(),
          const SizedBox(height: kSP10x),
          Padding(
            padding: const EdgeInsets.all(kSP10x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EasyText(
                  text: kAboutBook,
                  textColor: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: kFontSize18x,
                ),
                const SizedBox(height: kSP10x),
                EasyText(
                  text: bookVo.description ?? '',
                  textColor: kHintTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: kFontSize14x,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
