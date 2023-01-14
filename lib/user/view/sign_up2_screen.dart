import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:new_me_re/common/component/custom_text_form_field.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/login_layout.dart';

class SignUp2Screen extends StatefulWidget {
  const SignUp2Screen({super.key});

  @override
  State<SignUp2Screen> createState() => _SignUp2ScreenState();
}

class _SignUp2ScreenState extends State<SignUp2Screen> {
  String nickName = '';
  bool isUnique = true;
  @override
  Widget build(BuildContext context) {
    //final isRight = false;
    return LoginLayout(
      hasAppBer: true,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(circle_check),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SvgPicture.asset(dots),
                  ),
                  SvgPicture.asset(circle_fill_02),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '정보까지 입력하면\n가입 완료!',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 20.0),
              Text('닉네임'),
              const SizedBox(height: 8.0),
              Stack(
                children: [
                  CustomTextFormField(
                    isPonNumber: false,
                    hintText: '닉네임을 입력하세요.',
                    errorText: isUnique ? null : '동일한 닉네임이 존재합니다.',
                    onChanged: (String value) {
                      nickName = value;
                    },
                  ),
                  Positioned(
                    top: 13,
                    right: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: MediaQuery.of(context).size.width * 0.10,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: PRIMARY_COLOR,
                          disabledBackgroundColor: INPUT_BG_COLOR,
                        ),
                        child: Text('중복확인'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text('생년월일'),
              const SizedBox(height: 8.0),
              Row(), //커스텀 드롭다운
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 8, top: 16, bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            '다음',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: PRIMARY_COLOR,
                      disabledBackgroundColor: INPUT_BG_COLOR,
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

class BirthDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;
  final String? initDateStr;

  BirthDatePicker({
    required this.onDateTimeChanged,
    this.initDateStr,
  });

  @override
  Widget build(BuildContext context) {
    final initDate =
        DateFormat('yyyy-MM-dd').parse(initDateStr ?? '2000-01-01');
    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        minimumYear: 1900,
        maximumYear: DateTime.now().year,
        initialDateTime: initDate,
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateTimeChanged,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
