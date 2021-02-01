import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/shock_price/filters.dart';
import 'package:tiki_clone/app/modules/main/controllers/today_sock_deal_controller.dart';
import 'package:tiki_clone/app/utils/const.dart';
import 'package:tiki_clone/app/utils/logger.dart';

class TodaySockDealPinedHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xFFBDBDBD),
      height: 100,
      padding: EdgeInsets.only(top: 5,bottom: 5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: content(),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            ),
            child: Icon(
              Icons.arrow_downward_sharp,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  Widget content() {
    Logger.debug("TodaySockDealPinedHeader");
    TodayDealController controller = Get.find();
    return Obx(
      () => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.listTag.length,
        itemBuilder: (context, index) {
          TagValues tagValues = controller.listTag[index];
          return Container(
            height: 90,
            width: 90,
            margin: index ==0 ? EdgeInsets.only(left: 5) : EdgeInsets.all(0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 1,
                  color: index == controller.posTagSelected
                      ? Colors.blue
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 5,
                ),
                CachedNetworkImage(
                  height: 50,
                  width: 50,
                  imageUrl: tagValues.thumbnailUrl,
                  errorWidget: (context, url, err) => Icon(Icons.error),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      tagValues.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimens.defaultTextSize,
                          color: index == controller.posTagSelected
                              ? Colors.blue
                              : Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
