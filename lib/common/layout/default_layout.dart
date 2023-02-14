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
                  ),
                  onPressed: () {},
                ),
                if (secondActionBtn != null)
                  IconButton(
                    icon: SvgPicture.asset(
                      secondActionBtn!,
                      color: Colors.black,
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
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
