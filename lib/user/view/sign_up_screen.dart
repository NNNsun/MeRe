import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/component/custom_text_form_field.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/login_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isClick = false;
  bool isRight = false;
  String poneNumber = '';
  String certifyNumber = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: LoginLayout(
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
                    SvgPicture.asset(circle_fill_01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SvgPicture.asset(dots),
                    ),
                    SvgPicture.asset(circle_02),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '전화번호 먼저\n인증할게요',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 16.0),
                Stack(
                  children: [
                    CustomTextFormField(
                      isNumber: true,
                      isPonNumber: true,
                      hintText: '전화번호를 입력하세요.',
                      onChanged: (String value) {
                        poneNumber = value;
                      },
                    ),
                    Positioned(
                      top: 13,
                      right: 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.width * 0.10,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (poneNumber.length == 13) {
                              isClick = true;
                            } else
                              isClick = false;
                          },
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: PRIMARY_COLOR,
                            disabledBackgroundColor: INPUT_BG_COLOR,
                          ),
                          child: Text('인증하기'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if (isClick)
                  Stack(
                    children: [
                      CustomTextFormField(
                        isNumber: true,
                        isPonNumber: false,
                        hintText: '인증번호를 입력하세요.',
                        onChanged: (String value) {
                          certifyNumber = value;
                        },
                      ),
                      Positioned(
                        top: 20,
                        right: 70,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.width * 0.10,
                          child: _CountdownPage(),
                        ),
                      ),
                      Positioned(
                        top: 13,
                        bottom: 13,
                        right: 10,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.width * 0.10,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              // api 요청
                            },
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: PRIMARY_COLOR,
                              disabledBackgroundColor: INPUT_BG_COLOR,
                            ),
                            child: Text('확인'),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}

class _CountdownPage extends StatefulWidget {
  const _CountdownPage({super.key});

  @override
  State<_CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<_CountdownPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${count.inSeconds}';
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      countText,
      style: TextStyle(
        color: IMPACT_COLOR,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
