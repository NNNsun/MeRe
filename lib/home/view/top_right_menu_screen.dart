import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopRightMenu extends StatelessWidget {
  const TopRightMenu({
    Key? key,
    required this.currentAddress,
  }) : super(key: key);

  final String currentAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            // 현재 주소
            currentAddress,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(bottom: 1),
            child: Icon(
              Icons.expand_more,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          icon: SvgPicture.asset(
            'asset/temp/home_img/home_global_img/coupon_icon.svg',
            height: 20,
            width: 20,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
            icon: SvgPicture.asset(
              'asset/temp/home_img/home_global_img/bell_btn.svg',
              height: 20,
              width: 20,
              color: Colors.black,
            ),
            onPressed: () {}),
      ],
    );
  }
}
