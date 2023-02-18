import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/const/service_logic.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/order/widget/basket_bottom_sheet.dart';
import 'package:new_me_re/order/widget/delete_all.dart';

class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({super.key});

  @override
  State<ShoppingBasket> createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
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
    double height = MediaQuery.of(context).size.height;
    double bottomSheetSize = height * 0.2;
    double cardHeight = height * 0.18;

    int costAll = 0;
    return DefaultLayout(
      backgroundColor: INPUT_BG_COLOR,
      title: '장바구니',
      firstActionBtn: home_btn,
      bottomSheet:
          BasketBottomSheet(bottomSheetSize: bottomSheetSize, costAll: costAll),
      child: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: DeleteAll(),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: Divider(height: 1),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              color: Colors.white,
              height: 50,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '비둘기는 멍청해보여',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Stack(children: [
              Container(
                  color: Colors.white,
                  height: cardHeight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('바닐라딜라이트라떼',
                                          style: TextStyle(fontSize: 18)),
                                      Row(
                                        children: const [
                                          Text('Ice / 옵션 / 옵션'),
                                          SizedBox(width: 10),
                                          Text('1개'),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                          // remove click effect
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
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
                                                color: PRIMARY_Dark_COLOR,
                                                fontSize: 16),
                                          ),
                                        )),
                                      ]),
                                      IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onPressed: addCount,
                                          icon: SvgPicture.asset(plus_btn)),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${calcStringToWon(count * 5000)}원',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                      ],
                    ),
                  )),
              Positioned(
                top: 5,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      print('삭제 아이콘 click!');
                    },
                    icon: SvgPicture.asset(
                      x_btn,
                    )),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
