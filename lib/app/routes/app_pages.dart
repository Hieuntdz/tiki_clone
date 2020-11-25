import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/bindings/home_binding.dart';
import 'package:tiki_clone/app/modules/main/view/main_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreenView(),
      binding: MainBinding(),
    ),
  ];
}
