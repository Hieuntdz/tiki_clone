import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/main_controller.dart';
import 'package:tiki_clone/app/modules/main/views/category/category_page.dart';
import 'package:tiki_clone/app/modules/main/views/home/home_page.dart';
import 'package:tiki_clone/app/routes/app_pages.dart';

import 'bottom_bar.dart';

class MainScreenView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: true,
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Obx(() {
                    switch (controller.currentTab.value) {
                      case RoutesPage.HOME:
                        return HomePage();
                      case RoutesPage.CATEGORY:
                        return CategoryPage();

                      default:
                        return HomePage();
                    }
                  })),
              Container(
                height: 50,
                width: double.infinity,
                child: BottomBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
