import 'package:intl/intl.dart';

class Formats {
  // 포인트 단위 변환
  static final formatCurrency =
      NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);
  static String calcStringToWon(String priceString) {
    return "${formatCurrency.format(int.parse(priceString))} P";
  }
}
