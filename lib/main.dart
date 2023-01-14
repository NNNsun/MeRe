import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_me_re/user/view/sign_up_screen.dart';
import 'user/view/login_screen.dart';
import 'user/view/sign_up2_screen.dart';

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
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      // theme: ThemeData(
      //   primaryColor: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      //routerConfig: router,
      home: SignUp2Screen(),
      //LoginScreen(),
      //SignUpScreen(),
    );
  }
}
