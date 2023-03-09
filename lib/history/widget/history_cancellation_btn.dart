import 'package:flutter/material.dart';

import '../../common/const/color.dart';

class HistoryCancellationBtn extends StatelessWidget {
  const HistoryCancellationBtn({
    super.key,
    required this.width,
    required this.height,
    required this.isReview,
  });

  final double width;
  final double height;
  final bool isReview;

  @override
  Widget build(BuildContext context) {
    String title = "리뷰 작성하기";
    if (!isReview) title = "주문 취소하기";
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
          width: width - 40,
          height: height * 0.05,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: isReview ? INPUT_BG_COLOR : Colors.white,
                  foregroundColor: isReview ? Colors.black : PRIMARY_Dark_COLOR,
                  side: BorderSide(
                      color: isReview
                          ? IMPACT_COLOR_LIGHT_GRAY
                          : PRIMARY_Dark_COLOR),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: () {}, // 기능 바꾸기
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ))),
    );
  }
}
