import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';

class StoreListCard extends StatelessWidget {
  final String id;
  final String title; // 글자 수 제한
  final String congestion;
  final String rating;
  final bool isSale;
  final bool isNew;
  final String imageUrl;
  final String distance;
  const StoreListCard({
    Key? key,
    required this.id,
    required this.title,
    required this.congestion,
    required this.rating,
    required this.isSale,
    required this.isNew,
    required this.imageUrl,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String congestionIcon = createCongestionIcon();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(imageUrl, fit: BoxFit.cover), // 매장이미지
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Row(
                  children: [
                    if (isSale) const StoreBadge(badgeTitle: '할인'),
                    if (isNew) const StoreBadge(badgeTitle: 'NEW'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: AutoSizeText(
                      maxLines: 1,
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SvgPicture.asset(
                      congestionIcon, // 기본 = '보통'
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(black_star_icon, height: 14),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 3),
                    child: Text(
                      rating,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(location_icon),
              const SizedBox(
                width: 4,
              ),
              Text(
                '${distance}km',
                style: const TextStyle(
                  fontSize: 16,
                  color: BODY_TEXT_COLOR_GRAY,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  String createCongestionIcon() {
    String congestionIcon = list_normal;
    if (congestionIcon == '혼잡') {
      congestionIcon = list_crowded;
    } else if (congestion == '보통') {
      congestionIcon = list_normal;
    } else if (congestion == '여유') {
      congestionIcon = list_free;
    }
    return congestionIcon;
  }
}

class StoreBadge extends StatelessWidget {
  final String badgeTitle;
  const StoreBadge({
    Key? key,
    required this.badgeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: PRIMARY_COLOR.withOpacity(0.8),
        ),
        height: 25,
        width: 50,
        child: Text(
          badgeTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
