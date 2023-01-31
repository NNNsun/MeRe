import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';

class StoreListCard extends StatelessWidget {
  // final String id;
  // final String title;
  // final String congestion;
  // final String rating;
  // final bool isSale;
  // final bool isNew;
  const StoreListCard({
    Key? key,
    // required this.id,
    // required this.title,
    // required this.congestion,
    // required this.rating,
    // required this.isSale,
    // required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                    'asset/temp/home_img/cafe_data_img/cafe_main/cafe11.jpg',
                    fit: BoxFit.cover),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: PRIMARY_COLOR.withOpacity(0.8),
                        ),
                        height: 25,
                        width: 50,
                        child: const Text(
                          '할인',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: PRIMARY_COLOR.withOpacity(0.8),
                        ),
                        height: 25,
                        width: 50,
                        child: const Text(
                          'NEW',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: AutoSizeText(
                      maxLines: 1,
                      maxFontSize: 18,
                      '러블랑',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                      list_crowded,
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(star_icon, height: 14),
                  const Padding(
                    padding: EdgeInsets.only(left: 4, right: 3),
                    child: Text(
                      '4.54',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
