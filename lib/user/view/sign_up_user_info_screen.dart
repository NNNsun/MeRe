import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/component/custom_text_form_field.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';
import 'package:new_me_re/common/layout/login_layout.dart';

class SignUpUserInfoScreen extends StatefulWidget {
  const SignUpUserInfoScreen({super.key});

  @override
  State<SignUpUserInfoScreen> createState() => _SignUpUserInfoScreenState();
}

DateTime getNow() {
  DateTime now = DateTime.now();
  return now;
}

List getYears() {
  List years = [];
  int year = getNow().year;
  int oldYear = year - 100;
  for (year; year > oldYear; year--) {
    years.add(year);
  }
  return years;
}

List getMonths() {
  List months = [];
  for (int month = 1; month < 13; month++) {
    months.add(month);
  }
  return months;
}

List getDays() {
  List days = [];
  for (int day = 1; day < 32; day++) {
    days.add(day);
  }
  return days;
}

class _SignUpUserInfoScreenState extends State<SignUpUserInfoScreen> {
  @override
  void initState() {
    getYears();
    super.initState();
  }

  String nickName = '';
  bool isUnique = true;
  @override
  Widget build(BuildContext context) {
    //final isRight = false;
    return LoginLayout(
      hasAppBar: true,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                '???????????? ????????????\n?????? ??????!',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('?????????'),
              const SizedBox(height: 8.0),
              Stack(
                children: [
                  CustomTextFormField(
                    isNumber: false,
                    isNickName: true,
                    isPonNumber: false,
                    hintText: '???????????? ???????????????.',
                    errorText: isUnique ? null : '?????? ???????????? ??????????????????.',
                    onChanged: (String value) {
                      nickName = value;
                    },
                  ),
                  Positioned(
                    right: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        height: MediaQuery.of(context).size.width * 0.09,
                        child: ElevatedButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            // api ??????
                            // ????????? ??????
                            isUnique = true;
                            if (isUnique) {
                              checkNickName('??? ???????????? ?????? ??????????');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: PRIMARY_COLOR,
                            disabledBackgroundColor: INPUT_BG_COLOR,
                          ),
                          child: const Text('????????????'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text('????????????'),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomDropdown(
                          dateList: getYears(), initDate: getYears().first)),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: CustomDropdown(
                    dateList: getMonths(),
                    initDate: getNow().month,
                  )),
                  const SizedBox(width: 8.0),
                  Expanded(
                      child: CustomDropdown(
                    dateList: getDays(),
                    initDate: getNow().day,
                  )),
                ],
              ),
              const SizedBox(height: 40),
              const Text('??????'),
              const SizedBox(height: 8.0),
              _GenderButton(),
              const SizedBox(height: 40),
              const _NextButton(),
            ],
          ),
        ),
      ),
    );
  }

  void checkNickName(String str) {
    showDialog(
        context: context,
        barrierDismissible: true, // ?????? ?????? ????????? ????????? ??????
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            content: Text(
              str,
              textAlign: TextAlign.center,
            ),
            insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // ??????: ????????????
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '???',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

// ???????????? Dropdown
class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.dateList,
    required this.initDate,
  }) : super(key: key);
  final List dateList;
  final int initDate;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  int _dropdownValue = 0; // ?????????
  double? height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;
  final LayerLink _layerLink = LayerLink();
  GlobalKey actionKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    actionKey = LabeledGlobalKey(_dropdownValue.toString());
    _dropdownValue = widget.initDate;
    super.initState();
  }

  // ???????????? ?????????
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

  // ???????????? ??????
  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _customDropdown();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  // ???????????? ??????
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
    bool overlay = false;
    return GestureDetector(
      key: actionKey,
      child: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              overlay = !overlay;
              if (overlay) {
                _createOverlay();
              } else {
                _removeOverlay();
              }
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
                      // ?????????.
                      Text(
                        _dropdownValue.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),

                      // ?????????.
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

  // ????????????
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
          offset: Offset(0, height! + -4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              border: Border.all(color: INPUT_BORDER_COLOR),
              color: Colors.white,
            ),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: widget.dateList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    pressedOpacity: 1,
                    minSize: 0,
                    onPressed: () {
                      setState(() {
                        _dropdownValue = widget.dateList[index];
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

class _GenderButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => __GenderButtonState();
}

class __GenderButtonState extends State<_GenderButton> {
  List<String> genders = ['??????', '??????'];
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        2,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              selected: _selectedIndex == index,
              shape: StadiumBorder(
                side: BorderSide(
                    color: _selectedIndex == index
                        ? PRIMARY_COLOR
                        : INPUT_BORDER_COLOR),
              ),
              selectedShadowColor: null,
              pressElevation: 0.0,
              backgroundColor: INPUT_BG_COLOR,
              selectedColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              label: Text(
                genders[index],
                style: TextStyle(
                    color: _selectedIndex == index
                        ? PRIMARY_COLOR
                        : Colors.black26),
              ),
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// '?????? ????????????'Button
class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: PRIMARY_COLOR,
        disabledBackgroundColor: INPUT_BG_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '?????? ????????????',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
