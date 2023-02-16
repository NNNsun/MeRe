import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/service_logic.dart';
import 'package:new_me_re/order/widget/order_basket_btn.dart';

class BasketBottomSheet extends StatelessWidget {
  const BasketBottomSheet({
    Key? key,
    required this.bottomSheetSize,
    required this.costAll,
  }) : super(key: key);

  final double bottomSheetSize;
  final int costAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomSheetSize,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: bottomSheetSize * 2 / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '총 결제예정금액',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ]))
                ],
              ),
            ),
            SizedBox(
              height: bottomSheetSize * 3 / 5,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderBasketBtn(
                      bottomSheetSize: bottomSheetSize,
                      btnColor: PRIMARY_COLOR,
                      text: '매장이용',
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    OrderBasketBtn(
                      bottomSheetSize: bottomSheetSize,
                      btnColor: Colors.white,
                      text: '테이크아웃',
                      textColor: PRIMARY_COLOR,
                      borderColor: PRIMARY_COLOR,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
