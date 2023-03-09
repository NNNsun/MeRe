import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/common/widget/render_divider.dart';
import 'package:new_me_re/history/widget/history_cancellation_btn.dart';

import '../../common/const/img_path.dart';
import '../widget/render_chip_btn.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultLayout(
        leading: true,
        title: "주문내역",
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              // 바깥 레이어 (날짜)
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '2023.02.25',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              RenderChipBtn(
                                chipHeightPadding: 4,
                                backgroundColor: INPUT_BG_COLOR,
                                textColor: Colors.black,
                                title: "주문상세",
                                onTap: () {
                                  print("주문상세 click");
                                },
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Divider(
                            height: 0,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // network로 변경
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                    height: height * 0.11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: height * 0.11,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("가게명 click!");
                                            },
                                            child: Row(children: [
                                              const Text(
                                                "데일리레코드",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                store_btn,
                                                height: 12,
                                              )
                                            ]),
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "딸기잼스콘 외 1개",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              RenderChipBtn(
                                                chipHeightPadding: 3,
                                                backgroundColor: PRIMARY_COLOR,
                                                textColor: Colors.white,
                                                title: "진행중",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              "6500원",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("카카오페이",
                                                style: TextStyle(
                                                    color:
                                                        IMPACT_COLOR_LIGHT_GRAY))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            HistoryCancellationBtn(
                                width: width, height: height, isReview: true)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const RenderDivider(useHistory: false),
                ],
              ),
            ),
            SliverToBoxAdapter(
              // 바깥 레이어 (날짜)
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '2023.02.25',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              RenderChipBtn(
                                chipHeightPadding: 4,
                                backgroundColor: INPUT_BG_COLOR,
                                textColor: Colors.black,
                                title: "주문상세",
                                onTap: () {
                                  print("주문상세 click");
                                },
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Divider(
                            height: 0,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // network로 변경
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                    height: height * 0.11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: height * 0.11,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("가게명 click!");
                                            },
                                            child: Row(children: [
                                              const Text(
                                                "데일리레코드",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                store_btn,
                                                height: 12,
                                              )
                                            ]),
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "딸기잼스콘 외 1개",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              RenderChipBtn(
                                                chipHeightPadding: 3,
                                                backgroundColor: PRIMARY_COLOR,
                                                textColor: Colors.white,
                                                title: "진행중",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              "6500원",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("카카오페이",
                                                style: TextStyle(
                                                    color:
                                                        IMPACT_COLOR_LIGHT_GRAY))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            HistoryCancellationBtn(
                                width: width, height: height, isReview: true)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const RenderDivider(useHistory: false),
                ],
              ),
            ),
            SliverToBoxAdapter(
              // 바깥 레이어 (날짜)
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '2023.02.25',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              RenderChipBtn(
                                chipHeightPadding: 4,
                                backgroundColor: INPUT_BG_COLOR,
                                textColor: Colors.black,
                                title: "주문상세",
                                onTap: () {
                                  print("주문상세 click");
                                },
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Divider(
                            height: 0,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // network로 변경
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                    height: height * 0.11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: height * 0.11,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("가게명 click!");
                                            },
                                            child: Row(children: [
                                              const Text(
                                                "데일리레코드",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                store_btn,
                                                height: 12,
                                              )
                                            ]),
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "딸기잼스콘 외 1개",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              RenderChipBtn(
                                                chipHeightPadding: 3,
                                                backgroundColor: PRIMARY_COLOR,
                                                textColor: Colors.white,
                                                title: "진행중",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              "6500원",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("카카오페이",
                                                style: TextStyle(
                                                    color:
                                                        IMPACT_COLOR_LIGHT_GRAY))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            HistoryCancellationBtn(
                                width: width, height: height, isReview: true)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const RenderDivider(useHistory: false),
                ],
              ),
            ),
            SliverToBoxAdapter(
              // 바깥 레이어 (날짜)
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '2023.02.25',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              RenderChipBtn(
                                chipHeightPadding: 4,
                                backgroundColor: INPUT_BG_COLOR,
                                textColor: Colors.black,
                                title: "주문상세",
                                onTap: () {
                                  print("주문상세 click");
                                },
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Divider(
                            height: 0,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // network로 변경
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                    height: height * 0.11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: height * 0.11,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("가게명 click!");
                                            },
                                            child: Row(children: [
                                              const Text(
                                                "데일리레코드",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                store_btn,
                                                height: 12,
                                              )
                                            ]),
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "딸기잼스콘 외 1개",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              RenderChipBtn(
                                                chipHeightPadding: 3,
                                                backgroundColor: PRIMARY_COLOR,
                                                textColor: Colors.white,
                                                title: "진행중",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              "6500원",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("카카오페이",
                                                style: TextStyle(
                                                    color:
                                                        IMPACT_COLOR_LIGHT_GRAY))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            HistoryCancellationBtn(
                                width: width, height: height, isReview: true)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const RenderDivider(useHistory: false),
                ],
              ),
            ),
            SliverToBoxAdapter(
              // 바깥 레이어 (날짜)
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '2023.02.25',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              RenderChipBtn(
                                chipHeightPadding: 4,
                                backgroundColor: INPUT_BG_COLOR,
                                textColor: Colors.black,
                                title: "주문상세",
                                onTap: () {
                                  print("주문상세 click");
                                },
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Divider(
                            height: 0,
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                // network로 변경
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    'asset/temp/home_img/cafe_data_img/cafe_menu/menu_4.jpg',
                                    height: height * 0.11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: height * 0.11,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print("가게명 click!");
                                            },
                                            child: Row(children: [
                                              const Text(
                                                "데일리레코드",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(
                                                store_btn,
                                                height: 12,
                                              )
                                            ]),
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                "딸기잼스콘 외 1개",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              RenderChipBtn(
                                                chipHeightPadding: 3,
                                                backgroundColor: PRIMARY_COLOR,
                                                textColor: Colors.white,
                                                title: "진행중",
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              "6500원",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("카카오페이",
                                                style: TextStyle(
                                                    color:
                                                        IMPACT_COLOR_LIGHT_GRAY))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            HistoryCancellationBtn(
                                width: width, height: height, isReview: true)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const RenderDivider(useHistory: true),
                ],
              ),
            ),
          ],
        ));
  }
}
