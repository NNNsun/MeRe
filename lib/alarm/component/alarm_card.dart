import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmCard extends StatefulWidget {
  final String title;
  final String remainingTime;
  final String type;
  final String content;
  final String? imgUrl;

  final String id;
  const AlarmCard({
    super.key,
    this.imgUrl,
    required this.title,
    required this.remainingTime,
    required this.type,
    required this.content,
    required this.id,
  });

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  late SharedPreferences prefs;
  bool checked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final checkedAlarm = prefs.getStringList('checkedAlarm');
    if (checkedAlarm != null) {
      if (checkedAlarm.contains(widget.id) == true) {
        setState(() {
          checked = true;
          //checkedAlarm.clear(); 초기화
        });
      }
    } else {
      await prefs.setStringList('checkedAlarm', []);
    }
  }

  onHeartTap() async {
    print(checked);
    final checkedAlarm = prefs.getStringList('checkedAlarm');

    if (checkedAlarm != null) {
      checkedAlarm.add(widget.id);

      await prefs.setStringList('checkedAlarm', checkedAlarm);
      setState(() {
        checked = true;
        print(checkedAlarm);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    late String icon;
    if (widget.type == '쿠폰') {
      icon = coupon_icon;
    }

    if (widget.type == '할인') {
      icon = discount_icon;
    }
    return GestureDetector(
      onTap: onHeartTap,
      child: Container(
        color: checked ? Colors.white : PRIMARY_LIGHT_COLOR,
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  icon,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.remainingTime,
                            style: const TextStyle(
                              fontSize: 12,
                              color: BODY_TEXT_COLOR_GRAY,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: AutoSizeText(
                      widget.content,
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
