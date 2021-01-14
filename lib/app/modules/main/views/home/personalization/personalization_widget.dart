import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/personalization_homepage_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/utils/const.dart';

import 'feature_category_widget.dart';
import 'feature_search_widget.dart';

class PersonalizationWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.listPersonalHomeData == null || controller.listPersonalHomeData.length == 0) {
        return Container();
      }
      return Container(
        child: ListView.separated(
          itemCount: controller.listPersonalHomeData.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            PersonalizationHomeData homeData = controller.listPersonalHomeData[index];
            switch (homeData.type) {
              case AppPersonalHomeType.featuredCategories:
                {
                  return FeatureCategoryWidget(homeData);
                }

              case AppPersonalHomeType.featuredItems:
                {
                  return FeatureSearchWidget(homeData);
                }
              default:
                return Container();
            }
          },
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 7,
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
      );
    });
  }
}
