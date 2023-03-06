import 'package:flutter/material.dart';

class OrderBasketBtn extends StatelessWidget {
  const OrderBasketBtn({
    Key? key,
    required this.bottomSheetSize,
    this.borderColor,
    required this.btnColor,
    required this.textColor,
    required this.text,
    required this.onTap,
    this.buttonRatio = 0.45,
  }) : super(key: key);

  final double bottomSheetSize;
  final Color? borderColor;
  final Color btnColor;
  final Color textColor;
  final String text;
  final double buttonRatio;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: bottomSheetSize * buttonRatio,
          decoration: BoxDecoration(
            color: btnColor,
            border: Border.all(
                color: borderColor ?? Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
