import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(Main(AppPages.INITIAL));
}

class Main extends StatelessWidget {
  final String initialRoute;

  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        initialRoute: initialRoute,
        getPages: AppPages.routes,
      ),
    );

    // return  GetMaterialApp(
    //   initialRoute: initialRoute,
    //   getPages: AppPages.routes,
    // );
  }
}
