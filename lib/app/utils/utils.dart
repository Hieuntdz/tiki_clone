import 'package:intl/intl.dart';

class Utils {
  static String formatIntToNumber(int value) {
    final nf = new NumberFormat("#,##0", "en_US");
    return nf.format(value);
  }
}
