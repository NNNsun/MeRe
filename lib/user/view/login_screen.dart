import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_me_re/common/const/img_auth.dart';
import 'package:new_me_re/common/layout/default_layout.dart';
import 'package:new_me_re/common/layout/login_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SvgPicture.asset(
            title,
            height: MediaQuery.of(context).size.height * 0.027,
          ),
          SizedBox(
            height: 16,
          ),
          SvgPicture.asset(
            mere_logo_svg,
            height: MediaQuery.of(context).size.height * 0.063,
          ),
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(illust),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(children: <Widget>[
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  "간편로그인",
                  style: TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ),
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        kakao,
                      ),
                      iconSize: 50,
                    ),
                    Text(
                      '카카오톡',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        naver,
                      ),
                      iconSize: 50,
                    ),
                    Text(
                      '네이버',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        google,
                      ),
                      iconSize: 50,
                    ),
                    Text(
                      '구글',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
