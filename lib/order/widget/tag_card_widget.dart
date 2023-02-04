import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';

class TagCardWidget extends StatelessWidget {
  final String title;
  const TagCardWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Stack(children: [
        SvgPicture.asset(
          hashtag_btn,
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: Text(
            '#$title',
            style: const TextStyle(color: IMPACT_COLOR_DARK_GRAY, fontSize: 12),
          ),
        )),
      ]),
    );
  }
}
