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

class Date {
  bool isSelected;
  final int date;
  Date({
    this.isSelected = false,
    required this.date,
  });
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

List<Date> years = <Date>[];

class _SignUp2ScreenState extends State<SignUp2Screen> {
  @override
  void initState() {
    years = getYears();
    super.initState();
  }

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
              const SizedBox(height: 40),
              Text('생년월일'),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: CustomDropdown(dateList: getYears()), flex: 2),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: CustomDropdown(
                    dateList: getYears(),
                  )),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: CustomDropdown(
                    dateList: getYears(),
                  )),
                ],
              ),
              const SizedBox(height: 8.0),
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
  const CustomDropdown({Key? key, required this.dateList}) : super(key: key);
  final List dateList;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // 드롭다운 리스트.

  // 선택값
  int _dropdownValue = 12;
  double? height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;
  final LayerLink _layerLink = LayerLink();
  GlobalKey actionKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    actionKey = LabeledGlobalKey(_dropdownValue.toString());
    super.initState();
  }

  // 드롭박스 데이터
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

  // 드롭다운 생성.
  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _customDropdown();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () => _removeOverlay(),
      child: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              _createOverlay();
              findDropdownData();
            },
            child: CompositedTransformTarget(
              link: _layerLink,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: INPUT_BORDER_COLOR),
                  color: INPUT_BG_COLOR,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 5, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 선택값.
                      Text(
                        _dropdownValue.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),

                      // 아이콘.
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 드롭다운.
  OverlayEntry _customDropdown() {
    return OverlayEntry(
      maintainState: true,
      builder: (_) => Positioned(
        height: 4 * height!,
        left: xPosition,
        width: width,
        top: (yPosition! + height!),
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, height!),
          child: Material(
            color: INPUT_BG_COLOR,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: widget.dateList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    pressedOpacity: 1,
                    minSize: 0,
                    onPressed: () {
                      setState(() {
                        _dropdownValue = widget.dateList.elementAt(index);
                      });
                      _removeOverlay();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.dateList.elementAt(index).toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          height: 22 / 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
