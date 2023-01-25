import 'package:flutter/material.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Center(child: Text('설정')));
  }
}
