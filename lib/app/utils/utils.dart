import 'package:get/get_utils/src/platform/platform.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatIntToNumber(int value) {
    final nf = new NumberFormat("#,##0", "en_US");
    return nf.format(value);
  }

  static String getPlatform = GetPlatform.isAndroid ? "android" : "ios";
}
