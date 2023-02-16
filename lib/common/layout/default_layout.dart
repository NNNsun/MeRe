import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../const/img_path.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool stateBar;
  final bool leading;
  final String? firstActionBtn;
  final String? secondActionBtn;
  final Widget? bottomSheet;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.stateBar = true,
    Key? key,
    this.leading = true,
    this.firstActionBtn,
    this.secondActionBtn,
    this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white));
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor ?? Colors.white,
        appBar: renderAppBar(),
        body: child,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        leading: leading
            ? IconButton(
                icon: SvgPicture.asset(
                  back_btn,
                  height: 18,
                ),
                onPressed: () {},
              )
            : null,
        actions: firstActionBtn != null
            ? [
                IconButton(
                  icon: SvgPicture.asset(
                    firstActionBtn!,
                    color: Colors.black,
                    height: 22,
                  ),
                  onPressed: () {},
                ),
                if (secondActionBtn != null)
                  IconButton(
                    icon: SvgPicture.asset(
                      secondActionBtn!,
                      color: Colors.black,
                      height: 22,
                    ),
                    onPressed: () {},
                  ),
                const SizedBox(width: 8)
              ]
            : null,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
