import 'package:flutter/material.dart';
import 'package:new_me_re/alarm/component/alarm_card.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({
    super.key,
  });

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late SharedPreferences prefs;
  bool checked = false;
  List<Map<String, String>> alarms = [];
  late String title;
  createTempAlarmList() {
    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        alarms[i]["id"] = '$i';
        alarms[i]["title"] = '쿠폰소진안내';
        alarms[i]["type"] = '쿠폰';
        alarms[i]["remainingTime"] = '방금';
        alarms[i]["content"] = '온어데일리 전음료 1000원 할인이 3일 뒤 소진됩니다.';
      } else {
        alarms[i]["id"] = '$i';
        alarms[i]["title"] = '쿠폰소진안내';
        alarms[i]["type"] = '할인';
        alarms[i]["remainingTime"] = '1시간 전';
        alarms[i]["content"] = '온어데일리 전음료 1000원 할인이 3일 뒤 소진됩니다.';
      }
    }
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final checkAlarms = prefs.getStringList('checkAlarms');
    if (checkAlarms != null) {
      // if (checkAlarms.contains(widget.id) == true) {
      //   setState(() {
      //     checked = true;
      //   });
      // }
    } else {
      await prefs.setStringList('checkAlarms', []);
    }
  }

  onCheckTap() async {
    final checkAlarms = prefs.getStringList('checkAlarms');
    if (checkAlarms != null) {
      if (checked) {
        // checkAlarms.remove(widget.id);
      } else {
        // checkAlarms.add(widget.id);
      }
      await prefs.setStringList('checkAlarms', checkAlarms);
      setState(() {
        checked = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    createTempAlarmList();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '알림',
        child: ListView.builder(
          itemCount: alarms.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: onCheckTap(),
              child: AlarmCard(
                title: alarms[index]['title']!,
                type: alarms[index]['type']!,
                remainingTime: alarms[index]['remainingTime']!,
                content: alarms[index]['content']!,
                checked: false,
              ),
            );
          },
        ));
  }
}



// AlarmCard(
//         title: '쿠폰소진안내',
//         type: '쿠폰',
//         remainingTime: '방금',
//         content: '온어데일리 전음료 1000원 할인이 3일 뒤 소진됩니다.',
//         checked: true,
//       ),