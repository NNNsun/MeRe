import 'package:flutter/material.dart';

class OutlineCircleBtn extends StatefulWidget {
  const OutlineCircleBtn({
    super.key,
    this.onTap,
    this.borderSize = 0.5,
    this.radius = 25.0,
    this.borderColor = Colors.black,
    this.foregroundColor = Colors.white,
    this.child,
  });

  final onTap;
  final radius;
  final borderSize;
  final borderColor;
  final foregroundColor;
  final child;

  @override
  State<OutlineCircleBtn> createState() => _OutlineCircleBtnState();
}

class _OutlineCircleBtnState extends State<OutlineCircleBtn> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: widget.radius,
        height: widget.radius,
        decoration: BoxDecoration(
          border:
              Border.all(color: widget.borderColor, width: widget.borderSize),
          color: widget.foregroundColor,
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              child: widget.child ?? const SizedBox(),
              onTap: () async {
                print("!111");
              }),
        ),
      ),
    );
  }
}
