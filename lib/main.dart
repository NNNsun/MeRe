import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_me_re/common/const/color.dart';

import 'history/view/write_review_screen.dart';

void main() {
  runApp(const _App());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contex) {
    //final router = ref.watch(routerProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
          scrollBehavior: NoBouncingScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'NotoSans',
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: PRIMARY_COLOR,
            ),
            unselectedWidgetColor: IMPACT_COLOR_LIGHT_GRAY,
          ),
          // theme: ThemeData(
          //   primaryColor: Colors.blue,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          // ),
          //routerConfig: router,

          home: const WriteReviewScreen() // 리뷰작성
          // const Root(), // 메인화면

          // const HistoryScreen()
          // const SignUpAuthScreen(), // 회원가입- SMS인증
          // const SignUpUserInfoScreen(), // 회원가입- 유저정보 입력
          // const OrderMenuScreen() // 메뉴상세
          //ShoppingBasket() // 장바구니
          //const StoreDetailRoot() // 주문하기 Root

          // OrderDetailScreen() // 주문명세서

          // const LoginScreen(), // 첫 로그인 화면

          // const AlarmScreen(), // 홈-알림 화면
          // const AlarmScreen(), // 홈-알림 화면

          //const StoreListScreen() // 주문하기- 매장리스트
          ),
    );
  }
}

class NoBouncingScrollBehavior extends ScrollBehavior {
  @override
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
