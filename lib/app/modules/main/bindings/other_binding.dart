import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/other_screen_controller.dart';
import 'package:tiki_clone/app/modules/main/controllers/today_sock_deal_controller.dart';

class OtherScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherScreenController>(
      () => OtherScreenController(),
    );
    Get.put(TodayDealController());
  }
}
