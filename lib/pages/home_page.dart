import 'package:bookapp/bloc/home_page_bloc.dart';
import 'package:bookapp/constants/demis.dart';
import 'package:bookapp/constants/strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/vos/book_vo/book_vo.dart';
import '../itemview/home_page_itemview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List _pages = [const HomePageItemView(), const LibraryItemView()];
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(),
      child: Consumer<HomePageBloc>(
        builder: (context, bloc, child) => DefaultTabController(
          length: 2,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: (bloc.getSelectedTabBar == 1)
                ? const CreateNewFloatingActionButtonItemView()
                : null,
            body: SafeArea(
                child: Column(children: [
              const SizedBox(height: kSP10x),
              const SearchBarButtonItemView(),
              const SizedBox(height: kSP10x),
              Selector<HomePageBloc, List<BookVo>>(
                  selector: (_, bloc) => bloc.getCarouselList,
                  builder: (_, carouselList, child) {
                    carouselList.reversed;
                    print(carouselList);
                    return (carouselList.isNotEmpty)
                        ? CarouselSlider(
                            options: CarouselOptions(height: 300.0),
                            items: carouselList.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: 220,
                                    // margin: EdgeInsets.symmetric(horizontal: 5.0),

                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                i.bookImage ?? kDefaultImage))),
                                  );
                                },
                              );
                            }).toList(),
                          )
                        : const SizedBox();
                  }),
              _pages[bloc.getSelectedTab]
            ])),
            bottomNavigationBar: const BottomNavigationBarItemView(),
          ),
        ),
      ),
    );
  }
}
