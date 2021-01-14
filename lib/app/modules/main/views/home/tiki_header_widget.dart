import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/modules/main/views/home/curved_background.dart';
import 'package:tiki_clone/app/utils/const.dart';

import 'shock_price_widget.dart';

class TikiHeaderWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      child: Stack(
        children: [
          Obx(
            () {
              if (controller.listHomeBgBanner.length < 2) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: CurvedBackground(),
                  ),
                );
              } else {
                BannerData homeData = controller.listHomeBgBanner[0];
                BannerData bannerData = controller.listHomeBgBanner[1];
                return Stack(
                  children: [
                    CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: homeData.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CachedNetworkImage(
                        imageUrl: bannerData.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              }
            },
          ),
          Column(
            children: [
              TikiBanner(),
              SizedBox(
                height: 10,
              ),
              ShockPriceWidget(),
              SizedBox(
                height: 10,
              ),
              hotBanner(),
            ],
          )
        ],
      ),
    );
  }

  Widget hotBanner() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 70,
      child: Obx(
        () {
          if (controller.listHotBanner.length <= 0) {
            return Container();
          }
          BannerData bannerData = controller.listHotBanner[0];
          return CachedNetworkImage(
            imageUrl: bannerData.mobileUrl,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}

class TikiBanner extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: AppDimens.appPaddingLeftRight, right: AppDimens.appPaddingLeftRight),
      color: Colors.transparent,
      height: 130,
      child: Obx(
        () => Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller.bannerPageController,
              itemCount: controller.listHomeBanner.length,
              onPageChanged: (int page) => controller.onBannerPageViewChange(page),
              itemBuilder: (context, index) {
                BannerData homBanner = controller.listHomeBanner[index];
                return itemBanner(homBanner);
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 3,
                alignment: Alignment.center,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listHomeBanner.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: 2, right: 2),
                        width: 7,
                        height: 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: index == controller.currentBannerIndex.value ? Colors.white : Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemBanner(BannerData homeBanner) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: homeBanner.mobileUrl == null ? "" : homeBanner.mobileUrl,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
