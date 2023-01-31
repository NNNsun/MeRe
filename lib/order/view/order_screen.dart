import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/order/component/store_list_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool click = true;
  int _value = 0;
  int total = 100;
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leading: false,
      title: '매장목록',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: Text('전체 $total'),
            ),
            const StoreListCard()
          ],
        ),
      ),
    );
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
