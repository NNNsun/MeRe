import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/service_logic.dart';
import 'package:new_me_re/order/widget/order_basket_btn.dart';

class PriceBottomSheet extends StatelessWidget {
  const PriceBottomSheet({
    Key? key,
    required this.bottomSheetSize,
    required this.costAll,
    this.isMenuDetail = false,
    this.getChoice = false,
    required this.onTap,
  }) : super(key: key);

  final double bottomSheetSize;
  final int costAll;
  final bool isMenuDetail;
  final bool getChoice;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomSheetSize,
      decoration: isMenuDetail
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: isMenuDetail
            ? SizedBox(
                height: bottomSheetSize * 3 / 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OrderBasketBtn(
                      buttonRatio: 0.6,
                      onTap: () {},
                      bottomSheetSize: bottomSheetSize,
                      btnColor: PRIMARY_COLOR,
                      text: '${calcStringToWon(costAll)}원 담기',
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: bottomSheetSize * 2 / 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '총 결제예정금액',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: calcStringToWon(costAll),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black)),
                          const TextSpan(
                              text: '원',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ]))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: bottomSheetSize * 3 / 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderBasketBtn(
                          onTap: onTap,
                          bottomSheetSize: bottomSheetSize,
                          btnColor: PRIMARY_COLOR,
                          text: '${calcStringToWon(costAll)}원 주문하기',
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
