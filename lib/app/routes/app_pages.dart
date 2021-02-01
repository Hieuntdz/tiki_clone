import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/bindings/main_binding.dart';
import 'package:tiki_clone/app/modules/main/bindings/other_binding.dart';
import 'package:tiki_clone/app/modules/main/views/main_screen_view.dart';
import 'package:tiki_clone/app/modules/main/views/other_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.OTHER;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreenView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.OTHER,
      page: () => OtherScreenView(),
      binding: OtherScreenBinding(),
    ),
  ];
}
