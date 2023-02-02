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
    var controller = PageController();
    bool isMinbar;

    return LayoutBuilder(
      builder: (context, contains) {
        Size size = MediaQuery.of(context).size;
        double imageHeight = size.height * 0.3 + kToolbarHeight;
        return Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              primary: true,
              pinned: true,
              expandedHeight: size.height * 0.6,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        TagCard(),
                                        TagCard(),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(list_normal),
                                        const SizedBox(width: 4),
                                        const Chip(
                                            label: Text(
                                              'TAKEOUT ${'10분'}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.orange),
                                            ),
                                            backgroundColor: Colors.white,
                                            shape: StadiumBorder(
                                                side: BorderSide(
                                                    color: Colors.orange)),
                                            visualDensity: VisualDensity(
                                                horizontal: 0.0, vertical: -4)),
                                      ],
                                    ),
                                  ]),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  '온어데일리',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
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
                                          fontSize: 16,
                                          color: BODY_TEXT_COLOR_GRAY),
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
                            ],
                          ),
                        ),
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
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 100,
                    color: Colors.accents[index % Colors.accents.length],
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ));
      },
    );
  }

  SizedBox renderTitleBlur() {
    return SizedBox(
      height: 70,
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

class TagCard extends StatelessWidget {
  const TagCard({
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
        const Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: Text(
            '#애견동반',
            style: TextStyle(color: BODY_TEXT_COLOR_GRAY, fontSize: 12),
          ),
        )),
      ]),
    );
  }
}
