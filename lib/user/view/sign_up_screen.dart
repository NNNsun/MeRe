import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/component/custom_text_form_field.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/login_layout.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isRealPoneNumber = false;
  bool isClick = false;
  bool? isRightCertifyNumber;
  int authMaxCount = 5;
  int authMinCount = 0;
  String? errorText;
  bool disableAuth = false;
  bool disableTime = false;
  String poneNumber = '';
  String certifyNumber = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('=========================< Build >==========================');
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: LoginLayout(
        hasAppBer: true,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                const Text(
                  '전화번호 먼저\n인증할게요',
                  style: TextStyle(
                    fontSize: 28,
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
                        setState(() {
                          poneNumber = value;
                        });
                      },
                    ),
                    Positioned(
                      top: 20,
                      right: 70,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.width * 0.20,
                        // 카운트다운 실행되는 부분 !!
                        child: Text(
                          '$authMaxCount/5',
                          style: TextStyle(
                            color: IMPACT_COLOR,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 13,
                      right: 10,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.width * 0.10,
                        child: ElevatedButton(
                          onPressed: (poneNumber.length < 13 ||
                                  authMaxCount <= 0 ||
                                  disableAuth ||
                                  disableTime)
                              ? null
                              : () {
                                  setState(() {
                                    if (poneNumber.length == 13) {
                                      isClick = true;
                                      if (authMaxCount > 0) {
                                        --authMaxCount;
                                        ++authMinCount;
                                        clickEvent(authMinCount);
                                      }
                                      disableTime = true;
                                      Future.delayed(
                                          // 30초 딜레이
                                          const Duration(milliseconds: 30000),
                                          () {
                                        disableTime = false;
                                      });
                                    } else {
                                      isClick = false;
                                    }
                                  });
                                },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: PRIMARY_COLOR,
                            disabledBackgroundColor: Colors.black12,
                          ),
                          child: const Text('인증하기'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    CustomTextFormField(
                      isNumber: true,
                      isPonNumber: false,
                      hintText: '인증번호를 입력하세요.',
                      errorText: errorText,
                      onChanged: (String value) {
                        certifyNumber = value;
                        setState(() {
                          // api 요청
                          print(isRightCertifyNumber);
                          if (isRightCertifyNumber == null ||
                              isRealPoneNumber == true) {
                            errorText = null;
                            return;
                          }
                          if (isRightCertifyNumber == false) {
                            errorText = '인증번호를 확인해주세요.';
                            return;
                          }
                        });
                      },
                    ),
                    Positioned(
                      top: 20,
                      right: 70,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.width * 0.10,
                        // 카운트다운 실행되는 부분 !!
                        child: _CountdownPage(resetCount: authMinCount),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: MediaQuery.of(context).size.width * 0.10,
                          child: ElevatedButton(
                            onPressed: () {
                              // api 요청 -> try catch
                              // 인증번호가 틀렸다면 checkCertifyNumber
                              setState(() {
                                isRightCertifyNumber = false; // 틀렸다고 가정
                                if (isRightCertifyNumber!) {
                                  disableAuth = true;
                                }
                              });

                              // 다 틀렸다면? 모든 것을 초기화 시키고 초기화면으로 돌아감 => 상태관리
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
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.75),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10, height: 10),
                    ElevatedButton(
                      onPressed: (isRightCertifyNumber == null ||
                              isRightCertifyNumber == false)
                          ? null
                          : () {},
                      style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.black26,
                        shape: StadiumBorder(),
                        backgroundColor: PRIMARY_COLOR,
                        disabledBackgroundColor: INPUT_BG_COLOR,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 8, top: 16, bottom: 16),
                        child: Row(
                          children: const [
                            Text(
                              '다음',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
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

  void clickEvent(int resetCount) {
    _CountdownPage(
      resetCount: resetCount,
    );
  }
}

// 문제의 코드!!

class _CountdownPage extends SignUpScreen {
  //  00:00일 때 반환 필요
  final int resetCount;
  _CountdownPage({
    super.key,
    required this.resetCount,
  });

  @override
  State<_CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<_CountdownPage> {
  Timer? timer;
  Duration duration = Duration(seconds: 180);
  String minutesStr = '03';
  String secondsStr = '00';

  @override
  void initState() {
    if (widget.resetCount < 6) startTimer();

    super.initState();
  }

  void startTimer() {
    setState(() => Duration(seconds: 180));
    timer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => timer!.cancel());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;

    setState(() {
      int seconds = duration.inSeconds - reduceSecondsBy;
      secondsStr = (seconds % 60).toString().padLeft(2, '0').toString();
      minutesStr = (seconds / 60).floor().toString().padLeft(2, '0').toString();
      if (seconds <= 0) {
        timer!.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$minutesStr:$secondsStr',
      style: TextStyle(
        color: IMPACT_COLOR,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
