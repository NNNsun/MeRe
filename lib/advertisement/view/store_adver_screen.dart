import 'package:flutter/material.dart';

class StoreAdverScreen extends StatelessWidget {
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
    return SizedBox(
      height: 150,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: todaySale.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: (index == 0 ? 15 : 5),
                          right: (index == (todaySale.length - 1) ? 15 : 0)),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            shadowColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                todaySale[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
