import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/order/widget/price_bottom_sheet.dart';

import '../../common/const/service_logic.dart';
import '../widget/order_basket_btn.dart';

class ShoppingBasket extends StatefulWidget {
  String storeTitle = '온어데일리'; // 추후에 변경
  ShoppingBasket({
    super.key,
    // required 필요
  });

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
    String storeTitle = widget.storeTitle; // 스토어 이름
    double height = MediaQuery.of(context).size.height;
    double bottomSheetSize = height * 0.2;
    double cardHeight = height * 0.18;
    // 비어있는지 확인
    bool isEmpty = true;
    int costAll = count * 5000;
    return DefaultLayout(
      backgroundColor: isEmpty == true ? Colors.white : INPUT_BG_COLOR,
      title: '장바구니',
      firstActionBtn: home_btn,
      bottomSheet: isEmpty == true
          ? null
          : PriceBottomSheet(
              bottomSheetSize: bottomSheetSize, costAll: costAll, onTap: () {}),
      child: isEmpty == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    illust01,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  const Text(
                    '장바구니에 담긴 상품이 없어요!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    '미리 상품을 담아보세요',
                    style: TextStyle(fontSize: 16, color: IMPACT_COLOR_GRAY),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: OrderBasketBtn(
                      onTap: () {
                        print('매장리스트로 이동');
                      },
                      bottomSheetSize: bottomSheetSize,
                      btnColor: PRIMARY_COLOR,
                      text: '매장 구경하기',
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.only(bottom: bottomSheetSize),
              child: CustomScrollView(
                slivers: [
                  _renderDivider(),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      color: Colors.white,
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          storeTitle,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Stack(children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                    height: cardHeight - 40,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('뉴욕치즈타르트',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      Text('+ 딸기잼 추가(2)',
                                          style: TextStyle(
                                              color: IMPACT_COLOR_GRAY)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${calcStringToWon(5000)}원',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                // remove click effect
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: subCount,
                                                icon: SvgPicture.asset(
                                                  minus_btn,
                                                  height: 24,
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: IMPACT_COLOR_GRAY,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0)),
                                              width: 50,
                                              height: 32,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                '$count',
                                                style: const TextStyle(
                                                    color: PRIMARY_Dark_COLOR,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: addCount,
                                                icon: SvgPicture.asset(
                                                  plus_btn,
                                                  height: 24,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      _renderListDivider(),
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
                  ),
                ],
              ),
            ),
    );
  }

  Positioned _renderListDivider() {
    return const Positioned.fill(
      top: 0,
      child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 1,
              thickness: 1,
              color: INPUT_BG_COLOR,
            ),
          )),
    );
  }

  SliverToBoxAdapter _renderDivider() {
    return const SliverToBoxAdapter(
      child: Divider(
        height: 1,
        thickness: 1,
        color: INPUT_BG_COLOR,
      ),
    );
  }
}
