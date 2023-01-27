import 'package:flutter/material.dart';
import 'package:new_me_re/events/component/store_adver_screen.dart';

class StoreAdverScreen extends StatelessWidget {
  StoreAdverScreen({super.key});
  final List<String> todaySale = [
    'asset/temp/home_img/event_img/main_ad_1.jpg',
    'asset/temp/home_img/event_img/main_ad_2.jpg',
    'asset/temp/home_img/event_img/main_ad_3.jpg',
    'asset/temp/home_img/event_img/main_ad_4.jpg',
    'asset/temp/home_img/event_img/main_ad_5.jpg',
    'asset/temp/home_img/event_img/main_ad_6.jpg',
    'asset/temp/home_img/event_img/main_ad_7.gif',
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: (index == 0 ? 20 : 10),
                    right: (index == (todaySale.length - 1) ? 20 : 0)),
                child: GestureDetector(
                  onTap: () {},
                  child: StoreAdverCard(
                    storeImageUrl: todaySale[index],
                  ),
                ),
              );
            },
            itemCount: todaySale.length),
      ),
    );
  }
}
