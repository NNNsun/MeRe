import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
          title: '러블랑',
          congestion: congestion,
          rating: (i % 5).toString(),
          isSale: isSale,
          isNew: isNew,
          imageUrl: 'asset/temp/home_img/cafe_data_img/cafe_main/cafe$i.jpg',
          distance: (i % 1.4).toStringAsFixed(2).toString()));
    }
  }

  @override
  void initState() {
    createTempCafeList();
    super.initState();
  }

  bool click = true;
  int _value = 0;
  int total = 100;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const SearchBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    makeChip(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('전체 ${storeList.length}'),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: RefreshIndicator(
                    color: PRIMARY_COLOR,
                    onRefresh: _refresh,
                    child: ListView.builder(
                      itemCount: storeList.length,
                      itemBuilder: (context, index) {
                        return StoreListCard(
                            id: storeList[index].id,
                            title: storeList[index].title,
                            congestion: storeList[index].congestion,
                            rating: storeList[index].rating,
                            isSale: storeList[index].isSale,
                            isNew: storeList[index].isNew,
                            imageUrl: storeList[index].imageUrl,
                            distance: storeList[index].distance);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(milliseconds: 700));
  }

  Wrap makeChip() {
    String title = '';
    return Wrap(
      spacing: 5.0,
      children: List<Widget>.generate(
        3,
        (int index) {
          if (index == 0) {
            title = '거리순';
          } else if (index == 1) {
            title = '찜많은순';
          } else if (index == 2) {
            title = '별점순';
          }
          return ChoiceChip(
            selectedColor: const Color.fromARGB(255, 255, 244, 244),
            shape: StadiumBorder(
                side: BorderSide(
                    color:
                        _value == index ? PRIMARY_COLOR : Colors.transparent)),
            backgroundColor: INPUT_BG_COLOR,
            label: Text(
              title,
              style: TextStyle(
                color: _value == index ? PRIMARY_COLOR : INPUT_HINT_COLOR,
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
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("검색바 click!");
      },
      child: Container(
        decoration: BoxDecoration(
            color: INPUT_BG_COLOR,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        height: MediaQuery.of(context).size.height * 0.06,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(search_icon),
            ),
            const AutoSizeText(
              '카페이름, 해시태그를 검색하세요.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: INPUT_HINT_COLOR,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
