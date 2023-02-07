import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/component/custom_appbar.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/order/widget/custom_chip_widget.dart';
import 'package:new_me_re/order/widget/tag_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../common/const/color.dart';

class StoreDetailRoot extends StatefulWidget {
  const StoreDetailRoot({super.key});

  @override
  State<StoreDetailRoot> createState() => _StoreDetailRootState();
}

class _StoreDetailRootState extends State<StoreDetailRoot>
    with TickerProviderStateMixin {
  var top = 0.0;

  var pageController = PageController();
  late TabController _tabController;
  late TabController _menuTabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _menuTabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double minBarSize = MediaQuery.of(context).padding.top + kToolbarHeight;
    Size size = MediaQuery.of(context).size;
    double imageHeight = size.height * 0.3 + kToolbarHeight;
    double maxBarSize = size.height * 0.58;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              storeDetailAppBar(
                  size, imageHeight, pageController, maxBarSize, minBarSize),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverPersistentHeader(
                  floating: false,
                  delegate: TabBarDelegate(tabController: _tabController),
                  pinned: true,
                ),
              ),
            ];
          },
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = size.height - constraints.biggest.height;

                    return Column(
                      children: [
                        SizedBox(
                          height:
                              top <= minBarSize ? minBarSize - top + 50 : 50,
                        ),
                        Expanded(child: MyHomePage())
                      ],
                    );
                  },
                ),
                Container(
                  color: Colors.redAccent,
                ),
                Container(
                  color: Colors.blue,
                ),
              ]),
        ),
      ),
    );
  }
}

SliverAppBar storeDetailAppBar(Size size, double imageHeight,
    PageController controller, double maxBarSize, double minBarSize) {
  var top = 0.0;
  bool isFit = false;

  return SliverAppBar(
    stretch: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    floating: false,
    primary: true,
    pinned: true,
    expandedHeight: maxBarSize,
    flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      top = constraints.biggest.height;
      if (top == minBarSize) {
        isFit = true;
      } else {
        isFit = false;
      }
      return Stack(
        children: [
          FlexibleSpaceBar(
            title: isFit
                ? CustomAppBar(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    title: '온어데일리',
                  )
                : null,
            centerTitle: true,
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
                    ),
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
                                TagCardWidget(title: '애견동반'),
                                TagCardWidget(title: '노키즈존'),
                              ],
                            ),
                            const CustomChipWidget(title: '여유', timeTaken: 20),
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
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset(location_icon, height: 14),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Text(
                                    '경북경산시 청운로 12',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: IMPACT_COLOR_DARK_GRAY),
                                  ),
                                ),
                              ],
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
          renderTitleBlur(),
          if (!isFit)
            CustomAppBar(
              color: Colors.white,
              backgroundColor: Colors.transparent,
            )
        ],
      );
    }),
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

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController? tabController;
  TabBarDelegate({
    this.tabController,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 50,
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        tabs: [
          Tab(
            child: Container(
              color: Colors.white,
              child: const Text(
                "메뉴",
              ),
            ),
          ),
          Tab(
            child: Container(
              color: Colors.white,
              child: const Text(
                "정보",
              ),
            ),
          ),
          Tab(
            child: Container(
              color: Colors.white,
              child: const Text(
                "리뷰",
              ),
            ),
          ),
        ],
        indicatorWeight: 2,
        unselectedLabelColor: IMPACT_COLOR_LIGHT_GRAY,
        labelColor: PRIMARY_COLOR,
        indicatorColor: PRIMARY_COLOR,
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    const itemCount = 100;
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (BuildContext ctx, int idx) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text("Scroll to $idx "),
                    onPressed: () {
                      final contentSize =
                          controller.position.viewportDimension +
                              controller.position.maxScrollExtent;
                      final target = contentSize * idx / itemCount;
                      controller.position.animateTo(
                        target,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                );
              }),
        ),
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Item at index $index."),
              );
            },
            itemCount: itemCount,
          ),
        )
      ],
    );
  }
}
