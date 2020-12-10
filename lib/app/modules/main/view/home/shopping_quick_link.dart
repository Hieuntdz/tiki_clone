import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/banner_data.dart';
import 'package:tiki_clone/app/modules/main/controllers/home_controller.dart';
import 'package:tiki_clone/app/utils/const.dart';

class ShoppingQuickLink extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150,
      padding: EdgeInsets.only(left: AppDimens.appPaddingLeftRight, right: AppDimens.appPaddingLeftRight),
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.listShoppingQuickLink.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.3),
          itemBuilder: (context, index) {
            BannerData bannerData = controller.listShoppingQuickLink[index];
            return Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: bannerData.imageUrl,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      bannerData.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: AppDimens.defaultTextSize),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
