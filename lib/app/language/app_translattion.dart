import 'package:get/get.dart';
import 'package:tiki_clone/app/language/en_us_translation.dart';
import 'package:tiki_clone/app/language/vi_vn_translation.dart';

class AppTranslation extends Translations {
  Map<String, Map<String, String>> translations = {'en_US': enUs, 'vi_VN': viVn};

  @override
  Map<String, Map<String, String>> get keys => translations;
}
