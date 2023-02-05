import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/img_path.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  final Color color;
  final Color backgroundColor;
  CustomAppBar({
    this.title,
    Key? key,
    required this.color,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).padding.top,
        color: backgroundColor,
      ),
      Container(
          color: backgroundColor,
          height: kToolbarHeight - 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: SvgPicture.asset(back_btn, color: color),
                      onPressed: () {
                        print('뒤로가기');
                      },
                    ),
                  ),
                ),
                if (title != null)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        title!,
                        style: TextStyle(color: color, fontSize: 18),
                      ),
                    ),
                  ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            print('홈화면');
                          },
                          icon: SvgPicture.asset(
                            home_btn,
                            height: 24,
                            color: color,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('장바구니');
                          },
                          icon: SvgPicture.asset(
                            cart_btn,
                            height: 24,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    ]);
  }
}
