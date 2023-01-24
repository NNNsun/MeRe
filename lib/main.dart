import 'package:flutter/material.dart';
import 'package:new_me_re/common/view/root_tab.dart';

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

      home: const RootTab(),
      //SignUpUserInfoScreen(),
      //  SignUpAuthScreen(),
      //LoginScreen(),
    );
  }
}
