import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/main_controller.dart';
import 'package:tiki_clone/app/modules/main/view/bottom_bar.dart';

import 'file:///E:/FlutterProject/tiki_clone/lib/app/modules/main/view/home/home_page.dart';

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
                child: HomePage(),
              ),
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
