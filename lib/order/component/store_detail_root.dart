import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/const/color.dart';

class StoreDetailRoot extends StatefulWidget {
  const StoreDetailRoot({super.key});

  @override
  State<StoreDetailRoot> createState() => _StoreDetailRootState();
}

class _StoreDetailRootState extends State<StoreDetailRoot> {
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    return LayoutBuilder(
      builder: (context, contains) {
        Size size = MediaQuery.of(context).size;
        double imageHeight = size.height * 0.3 + kToolbarHeight;

        return Scaffold(
            body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                storeDetailAppBar(size, imageHeight, pageController),
                SliverPersistentHeader(
                  delegate: SliverDelegate(const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.grid_on)),
                    ],
                    indicatorColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                  )),
                  floating: true,
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(children: [Container(), Container(), Container()]),
          ),
        ));
      },
    );
  }

  SliverAppBar storeDetailAppBar(
      Size size, double imageHeight, PageController controller) {
    return SliverAppBar(
      floating: false,
      primary: true,
      pinned: true,
      expandedHeight: size.height * 0.58,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: size.width,
                  child: Stack(children: [
                    PageView.builder(
                      controller: controller,
                      itemBuilder: (context, index) {
                        return ExtendedImage.asset(
                            'asset/temp/home_img/cafe_data_img/cafe_main/cafe12.jpg',
                            fit: BoxFit.cover);
                      },
                      itemCount: 3,
                    ),
                    Positioned(
                      width: size.width,
                      bottom: 16,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: ColorTransitionEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            dotColor: INPUT_HINT_COLOR.withOpacity(0.5),
                            activeDotColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //list.builder로 만들기
                            Row(
                              children: const [
                                TagCard(title: '애견동반'),
                                TagCard(title: '노키즈존'),
                              ],
                            ),
                            const CustomChip(title: '혼잡', timeTaken: 20),
                          ]),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          '온어데일리',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(red_star_icon),
                          const SizedBox(width: 3.5),
                          const Text(
                            '4.9',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(location_icon, height: 14),
                          const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              '경북경산시 청운로 12',
                              style: TextStyle(
                                  fontSize: 16, color: IMPACT_COLOR_DARK_GRAY),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 2, top: 3),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: BODY_TEXT_COLOR_GRAY,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: IMPACT_COLOR_LIGHT_GRAY,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('1');
                              },
                              child: SizedBox(
                                height: 45,
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(call_icon),
                                    const SizedBox(width: 5),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        '전화',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(width: 24),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: VerticalDivider(
                                color: IMPACT_COLOR_LIGHT_GRAY,
                                thickness: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('2');
                              },
                              child: SizedBox(
                                height: 45,
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(share_icon),
                                    const SizedBox(width: 5),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        '공유',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: VerticalDivider(
                                color: IMPACT_COLOR_LIGHT_GRAY,
                                thickness: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('3');
                              },
                              child: SizedBox(
                                height: 45,
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 24),
                                    SvgPicture.asset(store_heart_icon),
                                    const SizedBox(width: 5),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        '찜',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: INPUT_BORDER_COLOR,
                  thickness: 8,
                  height: 1,
                )
              ],
            ),
          ),
          renderTitleBlur()
        ],
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(home_btn, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(cart_btn, color: Colors.white),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: SvgPicture.asset(back_btn, color: Colors.white),
        onPressed: () {},
      ),
      title: const Text(
        '온어데일리',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
    );
  }

  SizedBox renderTitleBlur() {
    return SizedBox(
      height: 100,
      child: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black38, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.15])),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CustomChip extends StatelessWidget {
  final String title;
  final int timeTaken;

  const CustomChip({
    required this.title,
    required this.timeTaken,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    if (title == '여유') {
      color = Colors.blue;
    } else if (title == '보통') {
      color = Colors.orange;
    } else if (title == '혼잡') {
      color = Colors.red;
    }

    return Row(
      children: [
        Chip(
            label: Text(
              title,
              style: TextStyle(fontSize: 12, color: color),
            ),
            backgroundColor: Colors.white,
            shape: StadiumBorder(side: BorderSide(color: color)),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4)),
        const SizedBox(width: 4),
        Chip(
            label: Text(
              'TAKETIME $timeTaken분',
              style: TextStyle(fontSize: 12, color: color),
            ),
            backgroundColor: Colors.white,
            shape: StadiumBorder(side: BorderSide(color: color)),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4)),
      ],
    );
  }
}

class TagCard extends StatelessWidget {
  final String title;
  const TagCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Stack(children: [
        SvgPicture.asset(
          hashtag_btn,
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: Text(
            '#$title',
            style: const TextStyle(color: IMPACT_COLOR_DARK_GRAY, fontSize: 12),
          ),
        )),
      ]),
    );
  }
}
