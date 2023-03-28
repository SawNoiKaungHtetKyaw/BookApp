
import 'package:bookapp/constants/colors.dart';
import 'package:bookapp/constants/demis.dart';
import 'package:bookapp/constants/strings.dart';
import 'package:bookapp/data/vos/book_vo/book_vo.dart';
import 'package:bookapp/widgets/easy_text.dart';
import 'package:flutter/material.dart';

class DetailsImageAndTitleItemView extends StatelessWidget {
  const DetailsImageAndTitleItemView({
    super.key,
    required this.bookVo,
  });

  final BookVo bookVo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Row(
        children: [
          Container(
            width: kDetailImageWidth,
            height: kDetailImageHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(bookVo.bookImage ?? kDefaultImage),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: kSP10x,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyText(
                  text: bookVo.title ?? '',
                  fontSize: kFontSize24x,
                  fontWeight: FontWeight.bold,
                  textColor: kTextColor,
                  overflow: TextOverflow.fade,
                ),
                EasyText(
                  text: bookVo.author ?? '',
                  fontWeight: FontWeight.w500,
                  textColor: kBorderColor,
                  overflow: TextOverflow.fade,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OverViewItemView extends StatelessWidget {
  const OverViewItemView({
    super.key,
    required this.bookVo,
  });

  final BookVo bookVo;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      DetailsOverView(
        icon: Icons.star,
        overViewText: "${bookVo.weeksOnList} reviews",
      ),
      Container(
        width: 1,
        height: 50,
        color: kBorderColor,
      ),
      const DetailsOverView(
        icon: Icons.book,
        overViewText: "Ebook",
      ),
      Container(
        width: 1,
        height: 50,
        color: kBorderColor,
      ),
      DetailsOverView(
        icon: Icons.menu_book_sharp,
        overViewText: "${bookVo.bookImageWidth} pages",
      ),
    ]);
  }
}

class DetailsOverView extends StatelessWidget {
  const DetailsOverView({
    super.key,
    required this.icon,
    required this.overViewText,
  });
  final IconData icon;
  final String overViewText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kTextColor,
          size: kDetailIconSize30x,
        ),
        const SizedBox(
          height: kSP5x,
        ),
        EasyText(
          text: overViewText,
          textColor: kBorderColor,
          fontSize: kFontSize16x,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}

class ReadNowButtonItemView extends StatelessWidget {
  const ReadNowButtonItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kFavoriteColor),
                onPressed: () {},
                child: const EasyText(
                  text: kReadNow,
                  textColor: kWhiteColor,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}

