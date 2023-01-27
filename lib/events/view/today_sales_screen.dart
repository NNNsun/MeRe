import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';

class TodaySales extends StatefulWidget {
  const TodaySales({super.key});
  @override
  State<TodaySales> createState() => _TodaySalesState();
}

class _TodaySalesState extends State<TodaySales> {
  CarouselController carouselController = CarouselController();

  final List<String> mainAd = [
    'asset/temp/home_img/event_img/real_main_ad_1.jpg',
    'asset/temp/home_img/event_img/real_main_ad_2.jpg',
    'asset/temp/home_img/event_img/real_main_ad_3.jpg',
    'asset/temp/home_img/event_img/real_main_ad_4.jpg',
    'asset/temp/home_img/event_img/real_main_ad_5.jpg',
  ];
  int _currentPage = 0;
  double _width = 0;
  List<Widget> generaterateImagesTiles() {
    return mainAd
        .map(
          (element) => Image.asset(
            element,
            fit: BoxFit.cover,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * 0.9 / mainAd.length;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.orange.shade100,
              child: CarouselSlider(
                carouselController: carouselController,
                items: generaterateImagesTiles(),
                options: CarouselOptions(
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  aspectRatio: MediaQuery.of(context).size.width /
                      MediaQuery.of(context).size.width,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  }),
                  autoPlay: true,
                  viewportFraction: 1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Stack(children: [
              Container(
                height: 3,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                left: _width * _currentPage,
                height: 2.5,
                width: _width,
                child: Container(
                  decoration: const BoxDecoration(color: PRIMARY_Dark_COLOR),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
