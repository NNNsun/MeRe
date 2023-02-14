import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/const/service_logic.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

class OrderMenuScreen extends StatefulWidget {
  const OrderMenuScreen({super.key});

  @override
  State<OrderMenuScreen> createState() => _OrderMenuScreenState();
}

class _OrderMenuScreenState extends State<OrderMenuScreen> {
  int count = 1;
  void addCount() {
    setState(() {
      if (count > 0) {
        ++count;
      }
    });
  }

  void subCount() {
    setState(() {
      if (count > 1) {
        --count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '메뉴상세',
      firstActionBtn: home_btn,
      secondActionBtn: cart_btn,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '온어데일리',
                        style: TextStyle(color: BODY_TEXT_COLOR_GRAY),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '바닐라딜라이트라떼',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        calcStringToWon(5000),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상 품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설 명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명상품설명',
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: INPUT_BORDER_COLOR,
                  thickness: 2,
                  height: 1,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '수량',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: subCount,
                                icon: SvgPicture.asset(minus_btn)),
                            Stack(children: [
                              SvgPicture.asset(
                                count_box,
                              ),
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '$count',
                                  style: const TextStyle(
                                      color: PRIMARY_Dark_COLOR, fontSize: 16),
                                ),
                              )),
                            ]),
                            IconButton(
                                onPressed: addCount,
                                icon: SvgPicture.asset(plus_btn)),
                          ],
                        ),
                      )
                    ]),
              ),
              const Divider(
                color: INPUT_BORDER_COLOR,
                thickness: 2,
                height: 1,
              ),
            ],
          )),
          // SliverList(delegate: )
        ],
      ),
    );
  }
}
