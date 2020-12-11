import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/data/model/dynamic_banner_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/modules/main/view/home/dynamic_banner/layout_new_seller2.dart';
import 'package:tiki_clone/app/utils/const.dart';

import 'layout_reward1.dart';
import 'layout_today_hot2.dart';
import 'layout_today_hot6.dart';

class DynamicBannerWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.listDynamicBanner.length,
          itemBuilder: (context, index) {
            DynamicBannerData dynamicBanner = controller.listDynamicBanner[index];
            switch (dynamicBanner.layout) {
              case AppDynamicBannerConfig.layoutRewards1:
                {
                  BannerData bannerData;
                  if (dynamicBanner.data != null && dynamicBanner.data.length >= 1) {
                    bannerData = dynamicBanner.data[0];
                  }
                  return LayoutReward1(dynamicBanner.title, bannerData);
                }

              case AppDynamicBannerConfig.layoutTodayHot2:
                {
                  return LayoutTodayHot2(
                    title: dynamicBanner.title,
                    listBanner: dynamicBanner.data,
                  );
                }
              case AppDynamicBannerConfig.layoutTodayHot6:
                {
                  return LayoutTodayHot6(
                    title: dynamicBanner.title,
                    listBanner: dynamicBanner.data,
                  );
                }

              case AppDynamicBannerConfig.layoutNewSeller2:
                {
                  return LayoutNewSeller2(
                    title: dynamicBanner.title,
                    listBannerData: dynamicBanner.data,
                  );
                }
              default:
                {
                  return Container();
                }
            }
          },
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 7,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
