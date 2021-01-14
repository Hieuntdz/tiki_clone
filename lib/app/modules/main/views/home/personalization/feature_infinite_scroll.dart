import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/home_tab_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';

class FeatureInfiniteScroll extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    HomeController controller = Get.find();

    return Container(
      width: double.infinity,
      height: 56,
      color: Colors.white,
      child: Obx(
        () => Row(
            children: controller.listHomeTabData.map((element) {
          HomeTabData homeTabData = element;
          int index = controller.listHomeTabData.indexOf(homeTabData);
          return Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {
                  controller.changeHomeTabSelected(index);
                },
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl: homeTabData.icon,
                        color: controller.currentHomeTabSelected.value == index ? Colors.red : Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Visibility(
                      visible: controller.currentHomeTabSelected.value == index ? true : false,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 20,
                        height: 3,
                      ),
                    ),
                  ],
                )),
          );
        }).toList()),
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
