// 화폐 단위 변환
import 'package:intl/intl.dart';

final formatCurrency =
    NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);
String calcStringToWon(int priceString) {
  return formatCurrency.format(priceString);
}
