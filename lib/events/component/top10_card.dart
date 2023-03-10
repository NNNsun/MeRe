import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';

class Top10Card extends StatelessWidget {
  final String cafeName;
  final String cafeImage;
  final String useTime;
  const Top10Card({
    Key? key,
    required this.cafeName,
    required this.cafeImage,
    required this.useTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // network로 바꿔야 함
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              cafeImage,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: AutoSizeText(
              maxLines: 1,
              cafeName,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: IMPACT_COLOR_GRAY),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: AutoSizeText(
              '기본이용시간:$useTime',
              maxLines: 1,
              style:
                  const TextStyle(fontSize: 4, color: IMPACT_COLOR_LIGHT_GRAY),
            ),
          ),
        ],
      ),
    );
  }
}
