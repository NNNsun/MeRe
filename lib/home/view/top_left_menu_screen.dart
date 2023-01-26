import 'package:flutter/material.dart';
import 'package:new_me_re/common/utils/formats.dart';

class TopLeftMenu extends StatelessWidget {
  const TopLeftMenu({
    Key? key,
    required this.currentProfile,
    required this.point,
  }) : super(key: key);

  final String currentProfile;
  final String point;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(currentProfile),
          ),
        ),
        Text(" ${Formats.calcStringToWon(point)}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
