import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/events/view/main_event_screen.dart';
import 'package:new_me_re/events/view/store_adver_screen.dart';
import 'package:new_me_re/events/view/top10_screen.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

import '../../events/view/attendence_event_screen.dart';
import '../../events/view/today_sales_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: ScrollConfiguration(
        // bounce 효과 제거
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            // 최상단 버튼 & 광고
            const SliverToBoxAdapter(child: MainEventScreen()),
            // 가게 광고
            SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                sliver: StoreAdverScreen()),
            renderTitle(title: '오늘의 할인 😎'),
            const TodaySales(),
            renderTitle(
                title: '주간 베스트 ',
                titleImage:
                    'asset/temp/home_img/home_global_img/top10_merged.svg'),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 30),
              sliver: Top10Screen(),
            ),
            renderTitle(title: '출석이벤트 🎁'),
            const AttendanceEvent(),
          ],
        ),
      ),
    );
  }

  SliverPadding renderTitle({required final String title, String? titleImage}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (titleImage == null)
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            if (titleImage != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500)),
                  SvgPicture.asset(titleImage),
                ],
              ),
            TextButton(
              style: TextButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text(
                "전체보기",
                style: TextStyle(
                  color: PRIMARY_Dark_COLOR,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
