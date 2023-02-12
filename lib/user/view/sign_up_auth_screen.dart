import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_me_re/common/component/custom_text_form_field.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/login_layout.dart';

class SignUpAuthScreen extends StatefulWidget {
  const SignUpAuthScreen({super.key});

  @override
  State<SignUpAuthScreen> createState() => _SignUpAuthScreenState();
}

class _SignUpAuthScreenState extends State<SignUpAuthScreen> {
  bool isRealPoneNumber = false;
  bool isClick = false;
  bool? isRightCertifyNumber;
  int authMaxCount = 5;
  int authMinCount = 0;
  String? errorText;
  bool disableAuth = false;
  bool disableTime = false;

  // TextField 부분
  String poneNumber = '';
  String certifyNumber = '';
  var myController = TextEditingController();
  createErrorText() {
    String errorText = '';
    if (isRightCertifyNumber == null || isRightCertifyNumber == true) {
      return null;
    }
    if (isRightCertifyNumber == false) {
      errorText = '인증번호를 확인해주세요.';
    }
    return errorText;
  }

  @override
  Widget build(BuildContext context) {
    print('=========================< Build >==========================');
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: LoginLayout(
        hasAppBar: true,
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
                          print(poneNumber);
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
                          style: const TextStyle(
                            color: PRIMARY_Dark_COLOR,
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
                                    print('인증하기 click');

                                    if (poneNumber.length == 13) {
                                      isClick = true;
                                      if (authMaxCount > 0) {
                                        --authMaxCount;
                                        ++authMinCount;
                                      }
                                      disableTime = true;
                                      Future.delayed(
                                          // 10초 딜레이
                                          const Duration(seconds: 10), () {
                                        setState(() {
                                          disableTime = false;
                                        });
                                      });
                                    } else {
                                      isClick = false;
                                    }
                                    // 해당 전화번호 기기로 인증번호 전송
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
                if (isClick)
                  Stack(
                    children: [
                      CustomTextFormField(
                        isNumber: true,
                        isPonNumber: false,
                        hintText: '인증번호를 입력하세요.',
                        errorText: createErrorText(),
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
                                // 인증번호가 틀렸다면 checkCertifyNumber
                                print('확인 click');
                                setState(() {
                                  // api 요청 -> try catch
                                  // certifyNumber
                                  if (isRightCertifyNumber == true) {
                                    showToast(msg: "이미 인증되었습니다");
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    return;
                                  }
                                  isRightCertifyNumber = true; // 확인 가정하는 부분
                                  if (isRightCertifyNumber!) {
                                    showToast(msg: "인증되었습니다 😊");
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  }
                                });

                                if (isRightCertifyNumber!) {
                                  disableAuth = true;
                                }

                                // 다 틀렸다면? 모든 것을 초기화 시키고 초기화면으로 돌아감 => 상태관리
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: PRIMARY_COLOR,
                                disabledBackgroundColor: INPUT_BG_COLOR,
                              ),
                              child: const Text('확인'),
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
                        shape: const StadiumBorder(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showToast({
  String msg = '',
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: PRIMARY_COLOR.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 14.0);
}

class _CountdownPage extends StatefulWidget {
  final int resetCount;
  const _CountdownPage({
    required this.resetCount,
  });

  @override
  State<_CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<_CountdownPage> {
  static const validTime = 300;
  int totalSeconds = validTime;
  bool isRunning = false;
  Timer? timer;
  int currentNumber = 0;
  void onTick(Timer timer) {
    print('onTick!!!!');
    if (totalSeconds == 0) {
      isRunning = false;
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStart() {
    totalSeconds = validTime;
    print('onStartPressed');
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    if (currentNumber < widget.resetCount && !isRunning) {
      onStart();
      currentNumber = widget.resetCount;
      isRunning = false;
    }
    return Text(
      format(totalSeconds),
      style: const TextStyle(
        color: PRIMARY_Dark_COLOR,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
