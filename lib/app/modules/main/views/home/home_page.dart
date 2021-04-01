import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/modules/main/views/home/dynamic_banner/dynamic_banner_widget.dart';

import 'personalization/content_tab_widget.dart';
import 'personalization/feature_infinite_scroll.dart';
import 'personalization/personalization_widget.dart';
import 'shopping_quick_link_widget.dart';
import 'tiki_appbar_widget.dart';
import 'tiki_header_widget.dart';

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
                  Obx(() =>
                      ContentTabWidget(controller.listTabProduct.toList()))
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
