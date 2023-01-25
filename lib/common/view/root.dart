import 'package:flutter/material.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/history/view/history_screen.dart';
import 'package:new_me_re/home/view/home_screen.dart';
import 'package:new_me_re/order/view/order_screen.dart';
import 'package:new_me_re/setting/screen/setting_screen.dart';
import 'package:new_me_re/wished/view/wished_screen.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//이동할 page 모음(인덱스 순으로 이동)
  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const OrderScreen(),
    const WishedScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
                icon: _selectedIndex == 0
                    ? Image.asset(home_acti)
                    : Image.asset(home_deacti)),
            Tab(
                icon: _selectedIndex == 1
                    ? Image.asset(home_acti)
                    : Image.asset(home_deacti)),
            Tab(
                icon: _selectedIndex == 2
                    ? Image.asset(point_acti)
                    : Image.asset(point_deacti)),
            Tab(
                icon: _selectedIndex == 3
                    ? Image.asset(history_acti)
                    : Image.asset(history_deacti)),
            Tab(
                icon: _selectedIndex == 4
                    ? Image.asset(my_acti)
                    : Image.asset(my_deacti)),
          ],
          indicatorColor: Colors.transparent,
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _widgetOptions,
      ),
    );
  }
}
