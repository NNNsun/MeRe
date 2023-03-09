import 'package:flutter/material.dart';
import 'package:new_me_re/common/layout/default_layout.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      leading: true,
      title: "리뷰작성",
      child: CustomScrollView(),
    );
  }
}
