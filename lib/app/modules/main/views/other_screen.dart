import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/other_screen_controller.dart';
import 'package:tiki_clone/app/modules/main/views/today_sock_deal/today_sock_deal_page.dart';

class OtherScreenView extends GetView<OtherScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: true,
        child: Center(
          child: Obx(() {
            if (controller.screenType.value == OtherScreenType.TODAY_DEAL)
              return TodaySockDealPage();
            return Container();
          }),
        ),
      ),
    );
  }
}

enum OtherScreenType { TODAY_DEAL }
