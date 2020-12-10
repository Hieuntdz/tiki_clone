import 'package:get/get.dart';
import 'package:tiki_clone/app/routes/app_pages.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var currentTab = RoutesPage.HOME.obs;

  void changeTab(String name) {
    currentTab.value = name;
  }
}
