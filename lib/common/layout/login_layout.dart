import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/img_path.dart';

class LoginLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;
  final bool? hasAppBer;
  LoginLayout({
    required this.child,
    this.hasAppBer,
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
      appBar: renderAppBar(hasAppBer!),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }

  AppBar? renderAppBar(bool hasAppbar) {
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
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
