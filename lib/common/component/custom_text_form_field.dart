import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_me_re/common/const/color.dart';
import 'package:new_me_re/common/const/img_path.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;

  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final bool isPonNumber;
  final bool isNickName;
  final bool isNumber;
  final bool isSearch;
  final bool isRequest;
  final TextEditingController? controller;

  const CustomTextFormField({
    required this.onChanged,
    this.isPonNumber = false,
    this.isSearch = false,
    this.autofocus = false,
    this.isNumber = false,
    this.isNickName = false,
    this.hintText,
    this.errorText,
    Key? key,
    this.controller,
    this.isRequest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    return TextFormField(
      controller: controller,
      cursorColor: PRIMARY_COLOR,
      keyboardType:
          isPonNumber || isNumber ? TextInputType.number : TextInputType.text,
      autofocus: autofocus,
      onChanged: onChanged,
      inputFormatters: [
        if (isNumber) FilteringTextInputFormatter.digitsOnly, // 숫자만!
        if (isPonNumber) _NumberFormatter(), // 하이픈 추가
        if (isNumber && !isPonNumber)
          LengthLimitingTextInputFormatter(6), // 인증번호 6글자
        // 폰번호, 닉네임 길이
        if (isPonNumber) LengthLimitingTextInputFormatter(13),
        if (isNickName) LengthLimitingTextInputFormatter(10),
        if (!isPonNumber && !isNickName && !isRequest)
          LengthLimitingTextInputFormatter(13),
        if (isRequest) LengthLimitingTextInputFormatter(50),
      ],
      decoration: InputDecoration(
        prefixIcon: isSearch
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  search_icon,
                  height: 12,
                ))
            : null,
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        // false - 배경색 없음
        // true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(),
        ),
      ),
    );
  }
}

class _NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex <= 3) {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-');
        }
      } else {
        if (nonZeroIndex % 7 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex > 4) {
          buffer.write('-');
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
