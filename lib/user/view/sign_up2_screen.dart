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
              // CustomDropdown(
              //   text: 'Call to action',
              // ),
              CustomDropdown(text: 'Call to action'),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.75,
              ),
              Text('성별'),
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

class CustomDropdown extends StatefulWidget {
  final String text;
  const CustomDropdown({
    required this.text,
    super.key,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey actionKey = GlobalKey();
  double? height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print('=========================================');
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
    print('=========================================');
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (_) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition! + height!,
        height: height! * 4, // 수정
        child: DropDown(
          itemHeight: height!, // 수정
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context)!.insert(floatingDropdown);
          }

          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: INPUT_BORDER_COLOR),
          color: INPUT_BG_COLOR,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(color: Colors.black26),
              ),
              Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black38,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({
    super.key,
    required this.itemHeight,
  });
  final double itemHeight;

  @override
  State<DropDown> createState() => _DropDownState();
}

class Date {
  bool isSelected;
  final int date;
  Date({
    this.isSelected = false,
    required this.date,
  });
}

class _DropDownState extends State<DropDown> {
  List<Date> years = <Date>[];
  List months = [];
  List days = [];
  @override
  void initState() {
    years = getYears();
    super.initState();
  }

  List<Date> getYears() {
    DateTime now = DateTime.now();
    int year = now.year;
    int oldYear = year - 100;
    for (year; year > oldYear; year--) {
      years.add(Date(date: year, isSelected: false));
    }
    return years;
  }

  List getMonths() {
    for (int calendar = 1; calendar < 13; calendar++) {
      months.add(calendar);
    }
    return months;
  }

  List getDays() {
    for (int calendar = 1; calendar < 32; calendar++) {
      days.add(calendar);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 4 * widget.itemHeight, //수정
        decoration: BoxDecoration(
          border: Border.all(color: INPUT_BORDER_COLOR),
          color: INPUT_BG_COLOR,
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  color:
                      years[index].isSelected ? Colors.black12 : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${years[index].date}",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    for (int i = 0; i < years.length; i++) {
                      years[i].isSelected = false;
                    }
                    years[index].isSelected = true;
                  });
                });
          },
          itemCount: years.length,
        ),
      ),
    );
  }
}




// ListView.builder(
//         itemCount: 100,
//         itemBuilder: (BuildContext ctx, int idx) {
//           return Text('Content Number ${idx}');
//         },
//       ),