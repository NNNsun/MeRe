import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';

class AlarmCard extends StatelessWidget {
  final String title;
  final String remainingTime;
  final String type;
  final String content;
  final String? imgUrl;
  final bool checked;
  const AlarmCard({
    super.key,
    this.imgUrl,
    required this.title,
    required this.remainingTime,
    required this.type,
    required this.content,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    late String icon;
    if (type == '쿠폰') {
      icon = coupon_icon;
    }

    if (type == '할인') {
      icon = discount_icon;
    }
// PRIMARY_LIGTH_COLOR
    return Container(
      color: checked ? Colors.white : PRIMARY_LIGHT_COLOR,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SvgPicture.asset(
                icon,
                height: MediaQuery.of(context).size.height * 0.06,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          remainingTime,
                          style: const TextStyle(
                            fontSize: 12,
                            color: BODY_TEXT_COLOR_GRAY,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: AutoSizeText(
                    content,
                    maxLines: 2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
