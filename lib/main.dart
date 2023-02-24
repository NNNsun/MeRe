import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/user/view/sign_up_auth_screen.dart';

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
        scrollBehavior: MyBehavior(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'NotoSans',
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: PRIMARY_COLOR,
          ),
        ),
        // theme: ThemeData(
        //   primaryColor: Colors.blue,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        //routerConfig: router,
        home: const SignUpAuthScreen(), // 회원가입- SMS인증

        //const OrderDetailScreen() // 주문명세서

        //const SignUpUserInfoScreen(), // 회원가입- 유저정보 입력

        //const StoreDetailRoot() // 주문하기 Root
        // const ShoppingBasket() // 장바구니

        //const OrderMenuScreen() // 메뉴상세

        // const Root(),
        //const LoginScreen(), // 첫 로그인 화면

        //const StoreListScreen() // 주문하기- 매장리스트

        // const AlarmScreen(), // 홈-알림 화면
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
