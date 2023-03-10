import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:readmore/readmore.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class StoreReviewPageScreen extends StatefulWidget {
  const StoreReviewPageScreen({
    Key? key,
    required this.top,
    required this.minBarSize,
    required this.scrollController,
    required this.grade,
    required this.ratings,
    required this.bottomGap,
  }) : super(key: key);

  final double top;
  final double minBarSize;
  final AutoScrollController scrollController;
  final double grade;
  final int ratings;
  final double bottomGap;

  @override
  State<StoreReviewPageScreen> createState() => _StoreReviewPageScreenState();
}

int reviewButton = 0;

class _StoreReviewPageScreenState extends State<StoreReviewPageScreen> {
  @override
  Widget build(BuildContext context) {
    int roundDown = widget.grade.ceil();
    int round = widget.grade.round();
    String ratingsStr = '';
    if (widget.ratings > 100) {
      ratingsStr = '100+';
    } else {
      ratingsStr = widget.ratings.toString();
    }
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: widget.top <= widget.minBarSize
                ? widget.minBarSize - widget.top + 50
                : 50,
          ),
          Expanded(
            child: CustomScrollView(
              controller: widget.top == widget.minBarSize
                  ? widget.scrollController
                  : null, //null일때 안쪽 list가 딸려올라가지않음
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          '매장 만족도',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          for (int i = 0; i < round; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SvgPicture.asset(yellow_star),
                            ),
                          if (roundDown != round)
                            SvgPicture.asset(yellow_half_star),
                          const SizedBox(width: 20),
                          Text(
                            '${widget.grade}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '($ratingsStr)',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Divider(
                        color: INPUT_BORDER_COLOR,
                        thickness: 8,
                        height: 1,
                      ),
                    ),
                  ]),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              reviewButton = 0;
                            });
                          },
                          style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              foregroundColor: reviewButton == 0
                                  ? PRIMARY_COLOR
                                  : IMPACT_COLOR_DARK_GRAY),
                          child: const Text('최신순'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: VerticalDivider(
                            color: IMPACT_COLOR_LIGHT_GRAY,
                            thickness: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              reviewButton = 1;
                            });
                          },
                          style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              foregroundColor: reviewButton == 1
                                  ? PRIMARY_COLOR
                                  : IMPACT_COLOR_DARK_GRAY,
                              disabledForegroundColor: IMPACT_COLOR_DARK_GRAY),
                          child: const Text('별점 높은 순'),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: VerticalDivider(
                            color: IMPACT_COLOR_LIGHT_GRAY,
                            thickness: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              reviewButton = 2;
                            });
                          },
                          style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              foregroundColor: reviewButton == 2
                                  ? PRIMARY_COLOR
                                  : IMPACT_COLOR_DARK_GRAY,
                              disabledForegroundColor: IMPACT_COLOR_DARK_GRAY),
                          child: const Text('별점 낮은 순'),
                        ),
                      ],
                    ),
                  ),
                )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '닉네임',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: Row(
                                          children: [
                                            for (int i = 0; i < round; i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: SvgPicture.asset(
                                                  yellow_star,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                ),
                                              ),
                                            if (roundDown != round)
                                              SvgPicture.asset(
                                                yellow_half_star,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                              ),
                                            const SizedBox(width: 10),
                                          ],
                                        ),
                                      ),
                                      const ReadMoreText(
                                        '리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내 용리뷰내  용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내 용리뷰내  용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내 용리뷰내  용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내 용리뷰내  용리뷰내용리뷰내용리뷰내용',
                                        trimLines: 3,
                                        textAlign: TextAlign.start,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: ' 더보기',
                                        trimExpandedText: ' 접기',
                                        moreStyle: TextStyle(
                                            color: IMPACT_COLOR_GRAY,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        lessStyle: TextStyle(
                                            color: IMPACT_COLOR_GRAY,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.asset(
                                      'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.19,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        if (index != (10 - 1))
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 3,
                              color: IMPACT_COLOR_LIGHT_GRAY,
                            ),
                          ),
                      ],
                    );
                  }, childCount: 10),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: widget.bottomGap),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
