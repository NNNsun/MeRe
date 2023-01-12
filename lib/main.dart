import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user/view/login_screen.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contex) {
    //final router = ref.watch(routerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 기본 폰트 모두 'NotoSans'로 변경
      // theme: ThemeData(
      //   fontFamily: 'NotoSans',
      // ),
      // theme: ThemeData(
      //   primaryColor: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      //routerConfig: router,
      home: LoginScreen(),
    );
  }
}
