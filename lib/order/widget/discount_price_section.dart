import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';

class DiscountPriceSection extends StatelessWidget {
  const DiscountPriceSection({
    super.key,
    required this.discountRate,
    required this.discountPrice,
    required this.oldPrice,
  });
  final int discountRate;
  final int discountPrice;
  final int oldPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            decoration: BoxDecoration(
                color: PRIMARY_LIGHT_COLOR,
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              "$discountRate%",
              style: const TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              '$discountPrice',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 6),
            child: Text(
              '원',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '$oldPrice원',
            style: const TextStyle(
                fontSize: 14,
                color: IMPACT_COLOR_DARK_GRAY,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
