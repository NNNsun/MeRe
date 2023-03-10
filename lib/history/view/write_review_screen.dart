import 'package:flutter/material.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DefaultLayout(
      leading: true,
      title: "리뷰작성",
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(children: [
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Image.asset(
                  "asset/temp/home_img/cafe_data_img/cafe_main/cafe12.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: height * 0.25,
                color: const Color.fromARGB(255, 39, 39, 39).withOpacity(0.6),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
