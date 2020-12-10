import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/modules/main/view/home/dynamic_banner/dynamic_banner_widget.dart';
import 'package:tiki_clone/app/modules/main/view/home/shopping_quick_link.dart';
import 'package:tiki_clone/app/modules/main/view/home/tiki_appbar.dart';
import 'package:tiki_clone/app/modules/main/view/home/tiki_header.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              TikiAppbar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    TikiHeader(),
                    ShoppingQuickLink(),
                    DynamicBannerWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
