import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/modules/main/view/home/dynamic_banner/dynamic_banner_widget.dart';
import 'package:tiki_clone/app/modules/main/view/home/personalization/content_tab_widget.dart';
import 'package:tiki_clone/app/modules/main/view/home/personalization/feature_infinite_scroll.dart';
import 'package:tiki_clone/app/modules/main/view/home/personalization/personalization_widget.dart';
import 'package:tiki_clone/app/modules/main/view/home/shopping_quick_link_widget.dart';
import 'package:tiki_clone/app/modules/main/view/home/tiki_appbar_widget.dart';
import 'package:tiki_clone/app/modules/main/view/home/tiki_header_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              TikiAppbarWidget(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    TikiHeaderWidget(),
                    ShoppingQuickLinkWidget(),
                    DynamicBannerWidget(),
                    Container(
                      width: double.infinity,
                      height: 7,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    PersonalizationWidget(),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: FeatureInfiniteScroll(),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Obx(() => ContentTabWidget(controller.listTabProduct.toList()))
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
