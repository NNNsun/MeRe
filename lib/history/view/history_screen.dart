import 'package:flutter/material.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: Center(child: Text('주문내역')));
  }
}
