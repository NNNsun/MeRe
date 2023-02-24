import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/component/custom_appbar.dart';
import 'package:new_me_re/order/view/store_review_page_screen.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/color.dart';
import '../../common/const/img_path.dart';
import '../widget/tag_card_widget.dart';

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
  late AutoScrollController scrollController;
  final wholePage = RectGetter.createGlobalKey();
  bool pauseRectGetterIndex = false;
  Map<int, dynamic> itemKeys = {};

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = _menuTabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      _menuTabController.animateTo(lastTabIndex);
    } else {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      // 메뉴탭바의 가운데로 이동
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (_menuTabController.index != middleIndex) {
        _menuTabController.animateTo(middleIndex);
      }
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    _menuTabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3); // list 길이
    _menuTabController = TabController(vsync: this, length: 3); // list 길이
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _menuTabController.dispose();
    scrollController.dispose();
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(wholePage);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });

    return items;
  }

  /// ListItem
  Widget buildCategoryItem(int index) {
    itemKeys[index] = RectGetter.createGlobalKey();
    //Category category = data.categories[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        //child: CategorySection(category: category),
      ),
    );
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
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            top = size.height - constraints.biggest.height;
            return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      renderInterval(minBarSize),
                      Expanded(
                        child: CustomScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: top == minBarSize
                              ? scrollController
                              : null, //null일때 안쪽 list가 딸려올라가지않음
                          slivers: [
                            SliverPersistentHeader(
                              delegate: MenuSearchHeaderDelegate(
                                  menuTabController: _menuTabController),
                              pinned: true,
                            ),
                            SliverList(
                              delegate: SliverChildListDelegate([
                                Container(color: Colors.red, height: 200.0),
                                Container(color: Colors.purple, height: 200.0),
                                Container(color: Colors.green, height: 200.0),
                                Container(color: Colors.teal, height: 200.0),
                                Container(color: Colors.white, height: 200.0),
                                Container(color: Colors.cyan, height: 200.0),
                                Container(color: Colors.red, height: 200.0),
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: top <= minBarSize ? minBarSize - top + 50 : 50,
                      ),
                      Expanded(
                        child: CustomScrollView(
                          controller: top == minBarSize
                              ? scrollController
                              : null, //null일때 안쪽 list가 딸려올라가지않음
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate([
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 10),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Image.asset(
                                        'asset/temp/home_img/cafe_data_img/cafe_main/cafe10.jpg',
                                        fit: BoxFit.cover), // 매장이미지
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    '매장소개',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                      '내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력',
                                      maxLines: 5),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30),
                                  child: Divider(
                                    color: INPUT_BORDER_COLOR,
                                    thickness: 8,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Table(
                                    children: const [
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            '전화번호',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text('053)252-2522'),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            '운영시간',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text('10:00 ~ 20:00'),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            '휴무일',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text('일요일???'),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            'SNS',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text('053)252-2522'),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            '사업자주소',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            '경산시 옥산로 펜타힐즈 경산시 옥산로 펜타힐즈경산시 옥산로 펜타힐즈경산시 옥산로 펜타힐즈',
                                            maxLines: 3,
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            '사업자등록번호',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 8),
                                          child: Text('053)252-2522'),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  StoreReviewPageScreen(
                      ratings: 101, // 100이상인 경우 고려
                      grade: 4.5,
                      top: top,
                      minBarSize: minBarSize,
                      scrollController: scrollController),
                ]);
          }),
        ),
      ),
    );
  }

  SizedBox renderInterval(double minBarSize) {
    return SizedBox(
      height: top <= minBarSize ? minBarSize - top + 50 : 50,
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
            collapseMode: CollapseMode.pin,
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
                      bottom: 14,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: ColorTransitionEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                            dotColor: INPUT_HINT_COLOR.withOpacity(0.5),
                            activeDotColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 2,
                ),
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
                          SvgPicture.asset(
                            red_star_icon,
                            height: 15,
                          ),
                          const SizedBox(width: 3.5),
                          const Text(
                            '4.9',
                            style: TextStyle(
                                fontSize: 15,
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
                                        fontSize: 14,
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
                                    SvgPicture.asset(
                                      call_icon,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        '전화',
                                        style: TextStyle(fontSize: 14.5),
                                      ),
                                    ),
                                    const SizedBox(width: 24),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 13),
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
                                    SvgPicture.asset(
                                      share_icon,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        '공유',
                                        style: TextStyle(fontSize: 14.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 13),
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
                                    SvgPicture.asset(
                                      store_heart_icon,
                                      height: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 3),
                                      child: Text(
                                        '찜',
                                        style: TextStyle(fontSize: 14.5),
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
          renderAppBarBlur(minBarSize: minBarSize),
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

class MenuSearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabController menuTabController;
  MenuSearchHeaderDelegate({required this.menuTabController});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      color: Colors.white,
      child: CustomTextFormField(
        hintText: '${'카페명'} 메뉴를 검색하세요',
        onChanged: (String value) {},
        autofocus: false,
        isSearch: true,
        errorText: null,
        obscureText: true,
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

SizedBox renderAppBarBlur({required double minBarSize}) {
  return SizedBox(
    height: minBarSize,
    child: FlexibleSpaceBar(
      collapseMode: CollapseMode.none,
      background: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black38, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.17])),
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
