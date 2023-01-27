import 'package:flutter/material.dart';

import '../component/top10_card.dart';

class Top10Screen extends StatelessWidget {
  Top10Screen({super.key});
  final List<Map<String, String>> top10 = [
    {
      'cafeName': '아뜰리에빈',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_1.png',
      'useTime': '1시간 20분'
    },
    {
      'cafeName': '온어데일리',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_2.jpg',
      'useTime': '1시간 20분'
    },
    {
      'cafeName': '데일리레코드',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_3.png',
      'useTime': '1시간 20분'
    },
    {
      'cafeName': '원피스카페',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_4.png',
      'useTime': '1시간 20분'
    },
    {
      'cafeName': '비둘기는 멍청해보여',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_5.jpg',
      'useTime': '1시간 20분'
    },
    {
      'cafeName': '나는문어',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_6.jpg',
      'useTime': '1시간 20분'
    },
    {
      'cafeName': '꿈을꾸는문어',
      'cafeImage': 'asset/temp/home_img/event_img/cafe_home_7.png',
      'useTime': '1시간 20분'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.29,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: (index == 0 ? 20 : 10),
                      right: (index == (top10.length - 1) ? 20 : 0)),
                  child: Top10Card(
                    cafeImage: top10[index]['cafeImage']!,
                    cafeName: top10[index]['cafeName']!,
                    useTime: top10[index]['useTime']!,
                  ));
            },
            itemCount: top10.length),
      ),
    );
  }
}
