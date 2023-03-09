import 'package:flutter/cupertino.dart';

class RenderChipBtn extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final double chipHeightPadding;
  final Function()? onTap;
  const RenderChipBtn({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    this.onTap,
    required this.chipHeightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: chipHeightPadding, horizontal: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
