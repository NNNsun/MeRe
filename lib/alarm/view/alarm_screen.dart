import 'package:flutter/material.dart';
import 'package:new_me_re/alarm/component/alarm_card.dart';
import 'package:new_me_re/alarm/model/alarm_model.dart';
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
  var alarms = List<AlarmModel>.empty(growable: true);
  createTempAlarmList() {
    String typeConvert;
    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        typeConvert = '쿠폰';
      } else {
        typeConvert = '할인';
      }
      // 한번에 담는법...ㅜㅜ
      alarms.add(AlarmModel(
          id: '$i',
          title: '쿠폰소진안내',
          type: typeConvert,
          remainingTime: '$i시간 뒤',
          content: '온어데일리의 전음료 1000원 할인 쿠폰이 3일뒤 소진됩니다.'));
    }
  }

  @override
  void initState() {
    super.initState();
    createTempAlarmList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '알림',
        //나중에 streambuilder로 감싸기
        child: ListView.builder(
          itemCount: alarms.length,
          itemBuilder: (context, index) {
            return AlarmCard(
              id: alarms[index].id,
              title: alarms[index].title,
              type: alarms[index].type,
              remainingTime: alarms[index].remainingTime,
              content: alarms[index].content,
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