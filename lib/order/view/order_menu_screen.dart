import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/order/widget/discount_price_section.dart';
import 'package:new_me_re/order/widget/price_bottom_sheet.dart';
import 'package:new_me_re/order/widget/remain_quantity.dart';

class OrderMenuScreen extends StatefulWidget {
  const OrderMenuScreen({super.key});

  @override
  State<OrderMenuScreen> createState() => _OrderMenuScreenState();
}

class _OrderMenuScreenState extends State<OrderMenuScreen> {
  int count = 1;
  String selectedRadio = 'ddd';
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

  String _choice = "";

  var checkBoxValue = List.filled(2, false);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double bottomSheetSize = height * 0.1;
    bool getChoice = false;
    return DefaultLayout(
      title: '메뉴상세',
      firstActionBtn: home_btn,
      secondActionBtn: cart_btn,
      bottomSheet: PriceBottomSheet(
          onTap: getChoice == false ? () {} : () {},
          getChoice: getChoice,
          bottomSheetSize: bottomSheetSize,
          costAll: count * 2000,
          isMenuDetail: true),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // network로 변경
                Image.asset(
                  'asset/temp/home_img/cafe_data_img/cafe_menu/menu_13.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '온어데일리',
                            style: TextStyle(
                                color: BODY_TEXT_COLOR_GRAY, fontSize: 16),
                          ),
                          RemainQuantity(remainQuantity: 2)
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '버건디가나슈케이크',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      const DiscountPriceSection(
                        discountRate: 30,
                        discountPrice: 2000,
                        oldPrice: 3500,
                        priceTextSize: 21,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '수제 가나슈를 듬뿍 넣고 구운 초콜릿 케이크입니다. 짱 맛있으니까 다들 한번 드셔보세요 츄라이츄라이.',
                        maxLines: 5,
                        style: TextStyle(color: IMPACT_COLOR_DARK_GRAY),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
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
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '수량',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            IconButton(
                                // remove click effect
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: subCount,
                                icon: SvgPicture.asset(minus_btn)),
                            Stack(children: [
                              Container(
                                height: 34,
                                width: 54,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: IMPACT_COLOR_LIGHT_GRAY)),
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
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
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
          // 옵션 부분
          // 1. 무조건 하나만 선택해야하는 옵션 + 기본
          // 2. 여러개 선택할수있는 옵션
          // 3. 옵션 자체의 갯수를 정하는 기능

          // 1. 옵션 단일 선택 (무조건 선택해야 함)
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Text(
                  "추가옵션",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 40,
                child: RadioListTile<String>(
                  contentPadding: const EdgeInsets.only(left: 10, right: 20),
                  dense: true,
                  activeColor: PRIMARY_COLOR,

                  title: const Align(
                    alignment: Alignment(-1.19, 0),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        "기본ㄴㄴㄴㄴㄴ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  value: "기본",
                  secondary: const Text("+0원"), // 가격 도출
                  groupValue: _choice,
                  onChanged: (val) {
                    setState(() {
                      getChoice = true;
                      _choice = val!;
                      print("500");
                      print(val);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: RadioListTile<String>(
                  contentPadding: const EdgeInsets.only(left: 10, right: 20),
                  dense: true,
                  activeColor: PRIMARY_COLOR,
                  title: const Align(
                      alignment: Alignment(-1.19, 0),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "딸기잼 추가",
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  value: "딸기잼",
                  secondary: const Text("+500원"),
                  groupValue: _choice,
                  onChanged: (val) {
                    setState(() {
                      _choice = val!; // String
                      print(val);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: RadioListTile<String>(
                  contentPadding: const EdgeInsets.only(left: 10, right: 20),
                  dense: true,
                  activeColor: PRIMARY_COLOR,

                  title: const Align(
                    alignment: Alignment(-1.19, 0),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        "사과잼 추가",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  value: "사과잼",
                  secondary: const Text("+500원"), // 가격 도출
                  groupValue: _choice,
                  onChanged: (val) {
                    setState(() {
                      _choice = val!;
                      print("500");
                      print(val);
                    });
                  },
                ),
              ),
            ]),
          ),
          // 2. 옵션 다중 선택
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Text(
                  "추가옵션(선택)",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              SizedBox(
                  height: 40,
                  child: CheckboxListTile(
                    contentPadding: const EdgeInsets.only(left: 10, right: 20),
                    secondary: const Text('+500원'),
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    activeColor: PRIMARY_COLOR,
                    dense: true,
                    title: const Align(
                      alignment: Alignment(-1.13, 0),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            '초 추가',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkBoxValue[0],
                    onChanged: (newValue) {
                      setState(() {
                        checkBoxValue[0] = newValue!;
                      });
                    },
                  )),
              SizedBox(
                  height: 40,
                  child: CheckboxListTile(
                    contentPadding: const EdgeInsets.only(left: 10, right: 20),
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    activeColor: PRIMARY_COLOR,
                    dense: true,
                    title: const Align(
                      alignment: Alignment(-1.13, 0),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            '포크 추가',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkBoxValue[1],
                    onChanged: (newValue) {
                      setState(() {
                        checkBoxValue[1] = newValue!;
                      });
                    },
                  )),
            ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: bottomSheetSize + 10),
          )
        ],
      ),
    );
  }
}
