import 'package:flutter/material.dart';
import 'package:new_me_re/advertisement/view/main_advertisement.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/home/view/top_menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MainAdvertisement()),
          SliverToBoxAdapter(child: TopMenuScreen()),
        ],
      ),
    );
  }
}




      //  // 프로필, 포인트
      //   Positioned(
      //     top: 48,
      //     left: 20,
      //     child: Row(
      //       children: [
      //         ClipOval(
      //           child: SizedBox(
      //             height: 30,
      //             width: 30,
      //             child: Image.asset(currentProfile),
      //           ),
      //         ),
      //         Text(" ${Formats.calcStringToWon(point)}",
      //             style: const TextStyle(
      //               fontWeight: FontWeight.w500,
      //             )),
      //       ],
      //     ),
      //   ),
      //   //주소, 쿠폰함, 알림함
      //   Positioned(
      //     top: 39,
      //     right: 5,
      //     child: Row(
      //       children: [
      //         InkWell(
      //           onTap: () {},
      //           child: Text(
      //             // 현재 주소
      //             currentAddress,
      //             style: const TextStyle(fontWeight: FontWeight.w500),
      //           ),
      //         ),
      //         InkWell(
      //           onTap: () {},
      //           child: const Padding(
      //             padding: EdgeInsets.only(bottom: 1),
      //             child: Icon(
      //               Icons.expand_more,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 5,
      //         ),
      //         IconButton(
      //           icon: SvgPicture.asset(
      //             'asset/temp/home_img/home_global_img/coupon_icon.svg',
      //             height: 20,
      //             width: 20,
      //             color: Colors.black,
      //           ),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //             icon: SvgPicture.asset(
      //               'asset/temp/home_img/home_global_img/bell_btn.svg',
      //               height: 20,
      //               width: 20,
      //               color: Colors.black,
      //             ),
      //             onPressed: () {}),
      //       ],
      //     ),
      //   ),
 