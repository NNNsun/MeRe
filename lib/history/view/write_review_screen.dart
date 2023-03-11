import 'package:flutter/material.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

import '../widget/star_buttons.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int stars = 0;

    return DefaultLayout(
      leading: true,
      title: "리뷰작성",
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                height: height * 0.25,
                width: width,
                // 네트워크로 변경
                child: Image.asset(
                  "asset/temp/home_img/cafe_data_img/cafe_main/cafe12.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: height * 0.25,
                color: const Color.fromARGB(255, 39, 39, 39).withOpacity(0.6),
              ),
              Column(
                children: [
                  const Text(
                    "PLFL, 어땠나요?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  StarButtons(
                    onIndexChanged: (count) {
                      stars = count + 1;
                      print("별점: $stars점");
                    },
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
