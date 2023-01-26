import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/home/view/top_left_menu_screen.dart';
import 'package:new_me_re/home/view/top_right_menu_screen.dart';

class MainAdverScreen extends StatefulWidget {
  const MainAdverScreen({super.key});
  @override
  State<MainAdverScreen> createState() => _MainAdverScreenState();
}

class _MainAdverScreenState extends State<MainAdverScreen> {
  CarouselController carouselController = CarouselController();

  //메인 광고리스트
  final List<String> mainAd = [
    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_1.jpg',
    'asset/temp/home_img/event_img/real_main_ad_2.jpg',
    'asset/temp/home_img/event_img/real_main_ad_3.jpg',
    'asset/temp/home_img/event_img/real_main_ad_4.jpg',
    'asset/temp/home_img/event_img/real_main_ad_5.jpg',
  ];
  // 프로필, 포인트, 주소, (쿠폰, 알림)
  String defaultProfile = "asset/temp/home_img/home_global_img/logo_circle.png";
  String profile = "profileUrl";
  String point = "2022";
  String currentAddress = "대구 광역시 교동";

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
    //프로필 최신화
    String currentProfile =
        profile.contains("profileUrl") ? defaultProfile : profile;
    _width =
        MediaQuery.of(context).size.width * (_currentPage + 1) / mainAd.length;

    return Stack(
      children: [
        //광고
        InkWell(
          onTap: () {},
          child: Container(
            color: Colors.orange.shade50, // 그냥
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
        // 프로필, 포인트
        Positioned(
          top: 48,
          left: 20,
          child: TopLeftMenu(currentProfile: currentProfile, point: point),
        ),
        //주소, 쿠폰함, 알림함
        Positioned(
          top: 39,
          right: 5,
          child: TopRightMenu(currentAddress: currentAddress),
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
