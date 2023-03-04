import 'package:flutter/material.dart';

import '../../common/const/color.dart';

class RemainQuantity extends StatelessWidget {
  const RemainQuantity({
    super.key,
    required this.remainQuantity,
  });
  final int remainQuantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: INPUT_BG_COLOR,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Text(
            "잔여수량",
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 4),
          Text(
            "$remainQuantity",
            style: const TextStyle(color: PRIMARY_Dark_COLOR),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
