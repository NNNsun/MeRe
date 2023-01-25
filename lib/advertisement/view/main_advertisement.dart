import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';

class MainAdvertisement extends StatefulWidget {
  const MainAdvertisement({super.key});
  @override
  State<MainAdvertisement> createState() => _MainAdvertisementState();
}

class _MainAdvertisementState extends State<MainAdvertisement> {
  CarouselController carouselController = CarouselController();

  //메인 광고리스트
  final List<String> mainAd = [
    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_1.jpg',
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
    _width =
        MediaQuery.of(context).size.width * (_currentPage + 1) / mainAd.length;
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            color: Colors.orange.shade50,
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
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
                    _width = MediaQuery.of(context).size.width *
                        (_currentPage + 1) /
                        mainAd.length;
                  });
                }),
                autoPlay: true,
                viewportFraction: 1,
              ),
            ),
          ),
        ),
        // 페이지 게이지
        Positioned(
          bottom: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            height: 3,
            width: _width,
            decoration: const BoxDecoration(color: PRIMARY_Dark_COLOR),
          ),
        ),
      ],
    );
  }
}
