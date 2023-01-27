import 'package:flutter/material.dart';

class StoreAdverCard extends StatelessWidget {
  // 광고 아이디
  // 리스트 인덱스 정보(이미지)
  final String storeImageUrl;

  const StoreAdverCard({
    required this.storeImageUrl,
    Key? key,
  }) : super(key: key);

  // 늘 다섯개
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          fit: BoxFit.fill,
          storeImageUrl,
          width: MediaQuery.of(context).size.width * 0.85,
        ));
  }
}
