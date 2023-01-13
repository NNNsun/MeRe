import 'package:flutter/material.dart';
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
  String poneNumber = '';
  @override
  Widget build(BuildContext context) {
    final isRight = false;
    return LoginLayout(
      hasAppBer: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SvgPicture.asset(circle_01),
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
                hintText: '전화번호를 입력하세요',
                onChanged: (String value) {
                  poneNumber = value;
                },
              ),
              CustomTextFormField(
                hintText: '전화번호를 입력하세요',
                onChanged: (String value) {
                  poneNumber = value;
                },
              ),
              Positioned(
                top: 13,
                bottom: 13,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: PRIMARY_COLOR,
                    disabledBackgroundColor: INPUT_BG_COLOR,
                  ),
                  child: Text('인증하기'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
