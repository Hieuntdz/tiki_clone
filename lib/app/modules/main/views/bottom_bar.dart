import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/language/app_lang.dart';
import 'package:tiki_clone/app/modules/main/controllers/main_controller.dart';
import 'package:tiki_clone/app/routes/app_pages.dart';
import 'package:tiki_clone/app/utils/const.dart';

class MyBottomBar {
  String pageKey;
  String title;
  IconData iconData;

  MyBottomBar(this.pageKey, this.title, this.iconData);
}

AppLang appLang = new AppLang();

class BottomBar extends GetView<MainController> {
  final List<MyBottomBar> myBottomBarList = [
    MyBottomBar(RoutesPage.HOME, appLang.getHomeText.tr, Icons.home),
    MyBottomBar(RoutesPage.CATEGORY, appLang.getCategoryText.tr, Icons.category),
    MyBottomBar(RoutesPage.SOCIAL, appLang.getSearchText.tr, Icons.strikethrough_s_outlined),
    MyBottomBar(RoutesPage.NOTICE, appLang.getNoticeText.tr, Icons.notification_important),
    MyBottomBar(RoutesPage.PROFILE, appLang.getProfileText.tr, Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...myBottomBarList.map<Widget>(
            (e) => Expanded(
              flex: 1,
              child: bottomBarItemWidget(e),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarItemWidget(MyBottomBar myBottomBar) {
    return GestureDetector(
      onTap: () {
        if (controller.currentTab.value != myBottomBar.pageKey) {
          print("bottomBarItemWidget change tab ${myBottomBar.pageKey}");
          controller.changeTab(myBottomBar.pageKey);
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                myBottomBar.iconData,
                color: controller.currentTab.value != myBottomBar.pageKey ? Colors.grey : Colors.blue,
                size: 24.0,
              ),
              Text(
                myBottomBar.title,
                style: TextStyle(
                  fontSize: AppDimens.defaultTextSize,
                  color: controller.currentTab.value != myBottomBar.pageKey ? Colors.grey : Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
