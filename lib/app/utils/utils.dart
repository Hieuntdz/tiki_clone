import 'package:get/get_utils/src/platform/platform.dart';
import 'package:intl/intl.dart';
import 'package:tiki_clone/app/utils/logger.dart';

class Utils {
  static String formatIntToNumber(int value) {
    final nf = new NumberFormat("#,##0", "en_US");
    return nf.format(value);
  }

  static String getPlatform = GetPlatform.isAndroid ? "android" : "ios";

  static int getTimesStamp(String dateTime) {
    Logger.debug("getTimesStamp $dateTime");
    DateTime tempDate = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    var date = new DateTime.fromMillisecondsSinceEpoch(tempDate.millisecondsSinceEpoch);
    return tempDate.millisecondsSinceEpoch;
  }
}