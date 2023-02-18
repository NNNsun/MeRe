import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/order/component/store_list_card.dart';

class StoreListScreen extends StatefulWidget {
  const StoreListScreen({super.key});

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  var storeList = List<StoreListCard>.empty(growable: true);

  createTempCafeList() {
    String congestion;
    bool isSale;
    bool isNew = false;

    for (int i = 1; i < 14; i++) {
      if (i == 13) {
        isSale = true;
        isNew = false;
        congestion = '보통';
      }
      if (i % 2 == 0) {
        congestion = '혼잡';
        isSale = true;
        if (i == 4) {
          isNew = true;
        }
      } else {
        congestion = '여유';
        isSale = false;
        if (i == 3) {
          isNew = true;
        }
      }
      // 한번에 담는법...ㅜㅜ
      storeList.add(StoreListCard(
          id: i.toString(),
          title: '비둘기는멍청해보여요',
          tagName: const ['애견동반', '노키즈존'],
          congestion: congestion,
          rating: (i % 5).toString(),
          isSale: isSale,
          isNew: isNew,
          imageUrl: 'asset/temp/home_img/cafe_data_img/cafe_main/cafe$i.jpg',
          distance: (i % 1.4).toStringAsFixed(2).toString()));
    }
  }

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    createTempCafeList();

    super.initState();
  }

  bool click = true;
  int _value = 0;
  int total = 100;
  String title = '';
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            '매장목록',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          foregroundColor: Colors.black,
        ),
        body: NestedScrollView(
          controller: scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverPersistentHeader(
              floating: false,
              delegate: SearchBarDelegate(),
              pinned: true,
            ),
            SliverAppBar(
              snap: true,
              floating: true,
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 8.0,
                  children: List<Widget>.generate(
                    4,
                    (int index) {
                      if (index == 0) {
                        title = '거리순';
                      } else if (index == 1) {
                        title = '찜많은순';
                      } else if (index == 2) {
                        title = '별점순';
                      } else if (index == 3) {
                        title = '할인순';
                      }
                      return ChoiceChip(
                        pressElevation: 0,
                        selectedColor: const Color.fromARGB(255, 255, 244, 244),
                        shape: StadiumBorder(
                            side: BorderSide(
                                color: _value == index
                                    ? PRIMARY_COLOR
                                    : Colors.transparent)),
                        backgroundColor: INPUT_BG_COLOR,
                        label: Text(
                          title,
                          style: TextStyle(
                            color: _value == index
                                ? PRIMARY_COLOR
                                : INPUT_HINT_COLOR,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        selected: _value == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = (selected ? index : index);
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              expandedHeight: 30,
            ),
          ],
          body: RefreshIndicator(
            color: PRIMARY_COLOR,
            backgroundColor: Colors.white,
            onRefresh: _refresh,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 8),
                    child: Text('전체 ${storeList.length}'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => StoreListCard(
                          id: storeList[index].id,
                          tagName: storeList[index].tagName,
                          title: storeList[index].title,
                          congestion: storeList[index].congestion,
                          rating: storeList[index].rating,
                          isSale: storeList[index].isSale,
                          isNew: storeList[index].isNew,
                          imageUrl: storeList[index].imageUrl,
                          distance: storeList[index].distance),
                      childCount: storeList.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(milliseconds: 700));
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  const SearchBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: () {
        print("검색바 click!");
      },
      child: Container(
        // 검색 바 padding
        padding: const EdgeInsets.only(bottom: 4, left: 20, right: 20),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              color: INPUT_BG_COLOR,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: SvgPicture.asset(
                  search_icon,
                  height: 18,
                ),
              ),
              const AutoSizeText(
                '카페이름, 해시태그를 검색하세요.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: INPUT_HINT_COLOR,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ChipsDelegate extends SliverPersistentHeaderDelegate {
  int value;
  ChipsDelegate({required this.value});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContente) {
    String title = '';

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Wrap(
        spacing: 8.0,
        children: List<Widget>.generate(
          4,
          (int index) {
            if (index == 0) {
              title = '거리순';
            } else if (index == 1) {
              title = '찜많은순';
            } else if (index == 2) {
              title = '별점순';
            } else if (index == 3) {
              title = '할인순';
            }
            return ChoiceChip(
              pressElevation: 0,
              selectedColor: const Color.fromARGB(255, 255, 244, 244),
              shape: StadiumBorder(
                  side: BorderSide(
                      color:
                          value == index ? PRIMARY_COLOR : Colors.transparent)),
              backgroundColor: INPUT_BG_COLOR,
              label: Text(
                title,
                style: TextStyle(
                  color: value == index ? PRIMARY_COLOR : INPUT_HINT_COLOR,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: value == index,
              onSelected: (bool selected) {
                setState(() {
                  value = (selected ? index : index);
                });
              },
            );
          },
        ).toList(),
      );
    });
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
