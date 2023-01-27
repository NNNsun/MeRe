import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/img_path.dart';

class LoginLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final bool hasAppBar;
  const LoginLayout({
    required this.child,
    this.hasAppBar = false,
    this.backgroundColor,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white));
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(hasAppBar),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }

  AppBar? renderAppBar(bool hasAppbar) {
    // 앱바버튼만 있는 경우
    if (hasAppbar && title == null) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            back_btn,
          ),
          onPressed: () {},
        ),
      );
    }
    // 앱바가 없는 경우
    if (!hasAppbar && title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            back_btn,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
